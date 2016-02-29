class Message < ActiveRecord::Base
  belongs_to :booking

  validates :content, length: { minimum: 20 }
end
