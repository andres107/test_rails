class Restaurant < ApplicationRecord
  belongs_to :address
  validates(
    :rating, 
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 5
    },
    presence: true
  )
  validates :name, :email, :site, :phone, presence: true

  def self.what_restaurants_are_here(latitude, longitude, radius)
    data = {}
    data[:count] = 0.23
    data[:avg] = 0.23
    data[:std] = 0.23
    data
  end
end
