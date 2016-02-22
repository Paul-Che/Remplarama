class Slot < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking

  validates :day, presence: true
  validates :status, presence: true

end
