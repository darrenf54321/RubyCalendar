class CreateCalendarEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_events do |t|
      t.string :name
      t.datetime :start_time
      t.string :calendar_completed
      t.string :details

      t.timestamps
    end
  end
end
