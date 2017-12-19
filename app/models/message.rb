class Message < ApplicationRecord
  validates :name, :email, :message, presence: true
  after_create :send_confirmation_email

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

  private

  def send_confirmation_email
    MessageMailer.confirmation(self).deliver_now
  end
end
