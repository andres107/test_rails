class Address < ApplicationRecord
  belongs_to :street
  validates :lat, :lng, presence: true
end
