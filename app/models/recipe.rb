class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
  has_many :cooking_steps
  accepts_nested_attributes_for :cooking_steps
end
