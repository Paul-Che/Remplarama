class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :slots
  has_many :messages

  validates :start_date, presence: true
  validates :end_date, presence: true
end
