class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  has_one :unit_of_measurement
  accepts_nested_attributes_for :unit_of_measurement
end
