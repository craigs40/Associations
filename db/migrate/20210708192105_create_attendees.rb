class CreateAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees do |t|
      t.integer :attendee_id
      t.timestampss
    end
  end
end
