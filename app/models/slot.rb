class Slot < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking
end
