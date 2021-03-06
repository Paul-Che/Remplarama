class Booking < ActiveRecord::Base
  # Plugins

  # Associations
  belongs_to :user
  belongs_to :slot
  has_one :contract, dependent: :destroy

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :commission, presence: true, inclusion: { in: 0..100 }

  # Callbacks
  # Class methods
  # Instance methods

end
