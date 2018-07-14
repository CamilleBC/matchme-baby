class Medium < ApplicationRecord
  belongs_to :user

  # validates_presence_of :medium, :user_id, :medium_type

  # Mount the uploaders
  mount_uploader :medium, ImageUploader
  # process_in_background :picture
  mount_uploader :video, VideoUploader
  # process_in_background :video
end
