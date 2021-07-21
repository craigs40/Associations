class Event < ApplicationRecord
  validates :name, :description, :location, :date, presence: true
  belongs_to :user, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendees
  has_many :users, through: :attendees
  scope :upcoming_events, -> { where('date >= ?', Date.today) }
  scope :past_events, -> { where('date < ?', Date.today) }
end
