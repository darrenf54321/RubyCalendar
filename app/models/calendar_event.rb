class CalendarEvent < ApplicationRecord

  has_many :calendar_event_joins
  has_many :users, :through => :calendar_event_joins, :source => :user

end
