class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user
  
  validates :description, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user_id, presence: true

end
