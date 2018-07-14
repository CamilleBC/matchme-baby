class Medium < ApplicationRecord
  belongs_to :user

  validates_presence_of :medium, :user_id, :type
  validates_uniqueness_of :medium

  # Mount the uploaders
  mount_uploader :image, ImageUploader
  # process_in_background :picture
  mount_uploader :video, VideoUploader
  # process_in_background :video
end
