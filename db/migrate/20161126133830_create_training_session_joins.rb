class CreateCalendarEventJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_event_joins do |t|
      t.integer :calendar_event_id
      t.integer :user_id

      t.timestamps
    end
    add_index :calendar_event_joins, :calendar_event_id
    add_index :calendar_event_joins, :user_id
    add_index :calendar_event_joins, [:calendar_event_id, :user_id], unique: true
  end
end
