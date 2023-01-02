class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates_length_of :name, maximum: 25, minimum: 3
  validates_uniqueness_of :name
  validates :status, inclusion: { in: [true, false] }
  # validates :status, inclusion: { in: %w(true false), message: "%{value} is not valid" }
end
