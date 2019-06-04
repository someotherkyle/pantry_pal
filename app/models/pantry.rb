class Pantry < ApplicationRecord
  belongs_to :user
  has_many :available_ingredients
  has_many :ingredients, through: :available_ingredients
end
