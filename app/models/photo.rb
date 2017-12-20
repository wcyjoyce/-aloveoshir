class Photo < ApplicationRecord
  validates :photo, presence: true

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  # Enables photo uploads
  mount_uploader :photo, PhotoUploader

  def next
    Photo.next(self.id).first
  end

  def previous
    Photo.previous(self.id).first
  end
end
