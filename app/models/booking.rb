class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :slots

  validates :start_date, presence: true
  validates :end_date, presence: true
end
