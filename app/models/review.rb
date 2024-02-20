class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, numericality: { only_integer: true }
end
