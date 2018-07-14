class User < ApplicationRecord
  extend FriendlyId
  include RoleChecker

  validates_presence_of :nickname, :firstname, :surname, :email
  validates_uniqueness_of :nickname, :email
  validates_length_of :nickname, within: 2..30

  has_many :media
  accepts_nested_attributes_for :media

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:marvin]

  # Calling destroy will set the deleted_at column
  acts_as_paranoid

  # Use friendly IDs in the URLs as slugs (no break URL, stoupid)
  friendly_id :slug_candidates, use: :slugged

  #  CanCan roles as a ruby constant
  ROLES = %i[admin user].freeze

  def self.from_omniauth(auth)
    # puts '****************** AUTH *******************'
    # ap auth
    # puts '*******************************************'
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.nickname = auth.info.nickname
      user.firstname = auth.extra.raw_info.first_name
      user.surname = auth.extra.raw_info.last_name
      # user.avatar = auth.info.image
    end
  end

  # Copy the data from the OmniAuth session if it exists
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.marvin_data']
        user.nickname = data[:extra][:raw_info][:login]
        user.email = data[:extra][:raw_info][:email]
        user.firstname = data[:extra][:raw_info][:first_name]
        user.surname = data[:extra][:raw_info][:last_name]
        # user.avatar = data[:info][:image]
      end
    end
  end

  # Override the devise notification to send mail to the ActiveJob queue
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private

  # defining slug candidates if slug is duplicate
  def slug_candidates
    [
      :nickname,
      %i[nickname firstname],
      %i[nickname firstname surname]
    ]
  end
end
