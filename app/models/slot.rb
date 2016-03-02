class Slot < ActiveRecord::Base
  belongs_to :user

  has_many :bookings

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  # scope :in_range, -> (start_date, end_date) do
  #   where("day >= :start_date AND day <= :end_date", start_date: start_date, end_date: end_date)
  # end
end
