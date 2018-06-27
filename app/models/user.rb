# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Mount the uploaders
  mount_uploader :picture, PictureUploader
  mount_uploader :video, VideoUploader
  # Use friendly IDs in the URLs as slugs (no break URL, stoupid)
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # defining slug candidates if slug is duplicate
  def slug_candidates
    [
      :nickname,
      %i[nickname firstname],
      %i[nickname firstname surname]
    ]
  end
end
