class State < ApplicationRecord
  validates :name, presence: true
  has_one :city, dependent: :destroy
  has_one :street, through: :city
end

