# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.destroy_all
User.destroy_all
UnitOfMeasurement.destroy_all


user = User.create(email: 'hello@hello.com', password: 'hellohello')
recipe = Recipe.create( {name: 'Burger', servings: 4, creator: user, owner: user} )
unitOfMeasurement = UnitOfMeasurement.create([ {name: '---' },
                                               { name: 'pound' },
                                               { name: 'tablespoon' },
                                               { name: 'teaspoon' },
                                               { name: 'cup' },
                                               { name: 'slice' },
                                               { name: 'gallon' },
                                               { name: 'clove' } ])

recipe.cooking_steps.create( [{step_count: 1, name: 'Mix the ground beef, salt and pepper in a large bowl and form the mixture into 8 equal-size balls.'}])
recipe.ingredients.create( [{name: 'ground beef', quantity: 2, unit_of_measurement: unitOfMeasurement[1]},
                            {name: 'salt', quantity: 1, unit_of_measurement: unitOfMeasurement[3]},
                            {name: 'pepper', quantity: 1/2, unit_of_measurement: unitOfMeasurement[3]} ] )
