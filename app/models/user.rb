# frozen_string_literal: true

class User < ApplicationRecord
  # Use friendly IDs in the URLs as slugs (no break URL, stoupid)
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates_presence_of :nickname, :firstname, :surname, :email
  validates_uniqueness_of :nickname, :email
  validates_length_of :nickname, within: 2..30

  # Calling destroy will set the deleted_at column
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Mount the uploaders
  mount_uploader :picture, PictureUploader
  mount_uploader :video, VideoUploader

  # defining slug candidates if slug is duplicate
  def slug_candidates
    [
      :nickname,
      %i[nickname firstname],
      %i[nickname firstname surname]
    ]
  end
end
