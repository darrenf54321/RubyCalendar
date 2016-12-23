class AddDetailsToCalendarEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :calendar_events, :details, :string
  end
end
