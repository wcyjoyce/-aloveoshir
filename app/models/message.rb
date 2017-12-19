class Message < ApplicationRecord
  validates :name, :email, :message, presence: true

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  # Enables photo uploads
  mount_uploader :photo, PhotoUploader

  def next
    Message.next(self.id).first
  end

  def previous
    Message.previous(self.id).first
  end
end
