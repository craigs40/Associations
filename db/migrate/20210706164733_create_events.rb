# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.text :location
      t.integer :creator_id
      t.string :attendee_id
      t.datetime :date
      t.timestamps
    end
  end
end
