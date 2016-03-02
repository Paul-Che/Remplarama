class Review < ActiveRecord::Base
  belongs_to :reviewed, class_name: 'User'
  belongs_to :reviewer, class_name: 'User'

  validates :rating, presence: true, inclusion: { in: 1..5 }
end
