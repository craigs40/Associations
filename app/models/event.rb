class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees, foreign_key: :attendee_id
end
