  class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :calendar_event_joins
  has_many :calendar_events, :through => :calendar_event_joins, :source => :calendar_event

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "400x400" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def has_mobile_number?
  	!self.mobile_number.nil?
  end

  def has_image_file?
    self.image.nil?
  end

  def belongs_to_calendar_event(event)
    event.users.include?(self)
  end

  def completed_calendar_events
    self.calendar_events.where(calendar_completed: "Yes")
  end

  def failed_calendar_events
    self.calendar_events.where(calendar_completed: "Didn't do it")
  end

  def pending_calendar_events
    seelf.calendar_events.where(calendar_completed: "Unconfirmed")
  end
end
