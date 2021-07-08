class Attendee < ApplicationRecord
  belongs_to :user
  benlongs_to :event
end
