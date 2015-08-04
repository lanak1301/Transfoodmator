class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  has_many :cooking_steps, dependent: :destroy
  accepts_nested_attributes_for :cooking_steps, allow_destroy: true
end
