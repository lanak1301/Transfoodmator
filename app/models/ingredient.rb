class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  has_one :unit_of_measurement
end
