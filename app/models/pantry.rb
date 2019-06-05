class Pantry < ApplicationRecord
  belongs_to :user
  has_many :available_ingredients
  has_many :ingredients, through: :available_ingredients
  accepts_nested_attributes_for :available_ingredients
end
