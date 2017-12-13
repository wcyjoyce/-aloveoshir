class Message < ApplicationRecord
  validates :name, :email, :message, presence: true

  # Enables photo uploads
  mount_uploader :photo, PhotoUploader
end
