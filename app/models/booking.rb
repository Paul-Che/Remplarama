class Booking < ActiveRecord::Base
  # Plugins

  # Associations
  belongs_to :user

  has_many :slots
  has_many :messages, dependent: :destroy

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true

  # Callbacks
  # Class methods
  # Instance methods

end
