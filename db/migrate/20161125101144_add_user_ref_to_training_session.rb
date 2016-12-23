class AddUserRefToCalendarEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :calendar_events, :user, foreign_key: true
  end
end
