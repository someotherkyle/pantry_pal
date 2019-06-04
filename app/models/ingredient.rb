class Ingredient < ApplicationRecord
  has_many :required_ingredients
  has_many :available_ingredients
  has_many :pantries, through: :available_ingredients
  has_many :recipes, through: :required_ingredients
end
