class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :slots
end
