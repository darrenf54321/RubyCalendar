class AddCalendarEventRefToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :calendar_event, foreign_key: true
  end
end
