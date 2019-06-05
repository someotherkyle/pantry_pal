class AvailableIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :pantry
end
