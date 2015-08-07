# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.destroy_all
User.destroy_all

users = [ {name: 'Mario Batali', email: 'mario@food.com', password: 'mario@food.com', avatar_img: 'app/assets/images/seeds/users/mariobatali.jpg'},
          {name: 'Cat Cora', email: 'cat@food.com', password: 'cat@food.com', avatar_img: 'app/assets/images/seeds/users/catcora.jpg'},
          {name: 'Masaharu Morimoto', email: 'masahuru@food.com', password: 'masahuru@food.com', avatar_img: 'app/assets/images/seeds/users/masahurumorimoto.jpg'}]

users.each do |user_params|
  avatar_img = user_params[:avatar_img]
  user_params.delete(:avatar_img)
  user = User.new(user_params)
  file_path = File.join(Rails.root, avatar_img)
  user.avatar = File.open(file_path) if File.exists?(file_path)
  user.save!
end

mario = User.find_by(email: 'mario@food.com')
cat = User.find_by(email: 'cat@food.com')
masahuru = User.find_by(email: 'masahuru@food.com')

recipes = [ {name: 'Grilled Focaccia Sandwich', servings: '4', creator_id: mario.id, avatar_img: 'app/assets/images/seeds/recipes/focaccia.jpg',
                       ingredients_attributes: [ { name: 'Zuccinni (sliced lengthwise into 1/2 inch pieces)', quantity: '2 piece'},
                                                 { name: 'Eggplant (sliced into 1/2 inch rounds)', quantity: '1 piece'},
                                                 { name: 'Red bell peppers (cut into quarters, stems and seeds removed)', quantity: '1 piece'},
                                                 { name: 'Red onion (peeled, sliced into 1/2 inch rings)', quantity: '1 piece'},
                                                 { name: 'Loaf focaccia (cut into 6 inch rectangles, sliced in half horizontally)', quantity: '1 piece'},
                                                 { name: 'Jar red pepper sauce (such as the Serbian sauce called Ajvar)', quantity: '1'},
                                                 { name: 'Baby arugula', quantity: '1 cup'},
                                                 { name: 'Extra-virgin olive oil', quantity: ''},
                                                 { name: 'Kosher salt and freshly ground black pepper', quantity: ''},
                                                 { name: 'red chili flakes (optional)', quantity: ''}
                                               ],
                      cooking_steps_attributes: [ { step_count: 1, name: 'Preheat a grill or grill pan to medium-high heat.', time: '10 min'},
                                                  { step_count: 2, name: 'Put patty on the bun', time: '2 min'},
                                                  { step_count: 3, name: 'Season all the cut vegetables with salt and pepper and drizzle with extra virgin olive oil to coat. If desired, sprinkle with a few red pepper flakes.', time: ''},
                                                  { step_count: 4, name: 'Place the vegetables on a hot grill in an even layer. Let char on one side, about 4 minutes. Flip all vegetables and char on the other side. Remove from grill and set aside.', time: '4 min'},
                                                  { step_count: 5, name: 'Meanwhile, on the cut side of the focaccia slices, drizzle with olive oil and season with salt and pepper. Place on the grill until charred, then remove.', time: ''},
                                                  { step_count: 6, name: 'To assemble, slather a few tablespoons of the basil pesto on one slice of the grilled focaccia. On another slice, slather a few tablespoons of the red pepper sauce. Top with a few grilled vegetables and some arugula leaves. Close sandwich with the other piece of focaccia. Repeat with remaining ingredients to build more sandwiches.', time: ''},
                                                  { step_count: 7, name: 'To serve, cut in half and enjoy!', time: ''},
                                                  { step_count: 8, name: 'Tip: Change up the vegetables with whatever is available at your local farmers market!', time: ''}
                                                ]
            },
{name: 'The Aperol Spritz', servings: '4 cocktails', creator_id: mario.id, avatar_img: 'app/assets/images/seeds/recipes/aperol.jpg',
                      ingredients_attributes: [ { name: 'Ice', quantity: ' '},
                                                { name: 'Aperol', quantity: '1 cup'},
                                                { name: 'Prosecco', quantity: '2 cups'},
                                                { name: 'Orange', quantity: '4 slices'},
                                                { name: 'Large green olives (optional)', quantity: '4 pieces'}
                                              ],
                     cooking_steps_attributes: [ { step_count: 1, name: 'Add 1/4 Aperol to 4 glasses and fill each with ice.', time: ''},
                                                 { step_count: 2, name: 'Pour 1/2 cup prosecco to each glass, add orange slice and place olive on top with a long toothpick.', time: ''},
                                                 { step_count: 3, name: 'Serve', time: ''}
                                               ]
                                            },
{name: 'Basic Tomato Sauce', servings: 'N/A', creator_id: mario.id, avatar_img: 'app/assets/images/seeds/recipes/tomatosauce.jpg',
                      ingredients_attributes: [ { name: 'Extra-virgin olive oil', quantity: '1/4 cup'},
                                                { name: 'Large onion, cut in 1/4 inch dice', quantity: '1 piece'},
                                                { name: 'Garlic, thinly sliced', quantity: '4 cloves'},
                                                { name: 'Chopped fresh thyme leaves, or 1 tablespoon dried', quantity: '3 tablespoons'},
                                                { name: 'Medium carrot, finely shredded', quantity: '1/2'},
                                                { name: '28-ounce cans peeled whole tomatoes, crushed by hand and juices reserved', quantity: '2'},
                                                { name: 'Kosher salt to taste', quantity: ''}
                                              ],
                     cooking_steps_attributes: [ { step_count: 1, name: 'In a 3-quart saucepans, heat the olive oil over medium heat, add the onion and garlic and cook until soft and light golden brown.', time: '8-10 min'},
                                                 { step_count: 2, name: 'Add the thyme and carrot and cook 5 minutes more, until the carrot is quite soft.', time: '5 min'},
                                                 { step_count: 3, name: 'Add the tomatoes and juice and brint to a boil, stirring often.', time: ''},
                                                 { step_count: 1, name: 'Lower the heat and simmer for 30 minutes until as thick as hot cereal.', time: '30 min'},
                                                 { step_count: 2, name: 'Season with salt.', time: ''},
                                                 { step_count: 3, name: 'This sauce holds 1 week in the refrigerator or up to 6 months in the freezer.', time: ''},
                                               ]
                                            },
{name: 'Chocolate Budino', servings: '12', creator_id: cat.id, avatar_img: 'app/assets/images/seeds/recipes/budino.jpg',
                     ingredients_attributes: [ { name: 'High-quality bittersweet chocolate', quantity: '1/2 pound'},
                                               { name: 'Large eggs, plus 3 large yolks', quantity: '3 '},
                                               { name: 'All-purpose flour', quantity: '3 tablespoons'},
                                               { name: 'Sugar', quantity: '1/2 cup'},
                                               { name: 'Unsalted butter, softened', quantity: '12 tablespoons'}
                                             ],
                    cooking_steps_attributes: [ { step_count: 1, name: 'Preheat the oven to 350° F.', time: ''},
                                                { step_count: 2, name: 'Grease or spray two 12-cup muffin tins with vegetable or canola oil. (You can also use just one tin and bake the batter in two batches.) Wipe out excess oil with a paper towel. Set the tin aside.', time: ''},
                                                { step_count: 3, name: 'Melt softened butter in a large bowl set over a saucepan of hot water (bain marie or double boiler) over very low heat.  As the butter is melting, grate the chocolate or chop it into small shards with a chef’s knife or a serrated knife. (It’s easiest if you begin at a corner, particularly if the chocolate is very thick. Take it slowly and keep your fingers safe.)', time: ''},
                                                { step_count: 4, name: 'Once the butter has melted, place the chopped chocolate in the bain marie and allow the chocolate to melt slowly, stirring until the mixture is smooth and the chocolate is completely incorporated.  Remove the bowl from the hot water and set aside.', time: ''},
                                                { step_count: 5, name: 'In a separate bowl, gently whisk the whole eggs, egg yolks, sugar, and flour. Mix until all of the ingredients are well incorporated.', time: ''},
                                                { step_count: 6, name: 'Slowly temper the sugar/egg mixture into the chocolate/butter mixture, stirring vigorously until well combined.', time: ''},
                                                { step_count: 7, name: 'Spoon the batter into the prepared muffin tins, filling each cup three-quarters full. Bake for 11 to 12 minutes for mini muffin tins., 18-20 minutes for full cake. The edges will have just begun to pull away from the pan, and the top of each budino should still look moist and shiny at the center. Remove tins from the oven and allow them to cool for 10 minutes. While the tins are still warm, place a baking sheet over the top of each muffin tin and invert it. Carefully lift the muffin tin to release cakes. Transfer the cakes to a serving platter or individual dessert plates. They’re at their best if served warm, but are also delicious at room temperature served with crème anglaise, whipped cream, and/or fresh berries.', time: '30 min'}
                                              ]
          },
{name: 'Blueberry Cheesecake', servings: '8-10', creator_id: cat.id, avatar_img: 'app/assets/images/seeds/recipes/cheesecake.jpg',
                    ingredients_attributes: [ { name: 'Unsalted butter for the pan', quantity: ' '},
                                              { name: 'Mascarpone cheese, softened', quantity: '3/4 pound'},
                                              { name: 'Cream cheese, softened', quantity: '18 ounce package'},
                                              { name: 'Sugar for the pan', quantity: '3/4 cup + 2 tablespoons'},
                                              { name: 'Finely grated lemon zest', quantity: '2 teaspoons'},
                                              { name: 'Fresh lemon juice', quantity: '1 1/2 teaspoons '},
                                              { name: 'Vanilla extract', quantity: '1 teaspoon'},
                                              { name: 'Large eggs', quantity: '3'},
                                              { name: 'All-purpose flour', quantity: '3 tablespoons'},
                                              { name: 'blueberries, fresh or frozen, thawed', quantity: '2 cups'},
                                              { name: 'Confectioners sugar for dusting (optional)', quantity: ''},
                                              { name: 'Whipped creme or creme fraiche (store-bought or homemade; optional)', quantity: ''},
                                            ],
                   cooking_steps_attributes: [ { step_count: 1, name: 'Preheat the oven to 350 degrees F and position a rack in the middle. Butter a 9-by-2-inch round cake pan or a 9-inch springform pan and dust with sugar, tilting the pan to coat and discarding any excess.', time: ''},
                                               { step_count: 2, name: 'In a large bowl, with an electric mixer on medium speed, beat the mascarpone, cream cheese, 3/4 cup sugar, 1 teaspoon of the lemon zest, lemon juice, and vanilla until smooth, about 2 minutes, scraping down the sides of the bowl once. Add the eggs, one at a time, beating well after each addition. Turn the mixer to low and add the flour, scraping the bowl to make sure it is incorporated.', time: ''},
                                               { step_count: 3, name: 'Pour the batter into the pan. Bake until the top of the cake is a deep golden brown and a toothpick inserted in the center comes out clean, 35 to 40 minutes. Let the cake cool in its pan on a rack for 15 to 20 minutes. Run a knife around the sides of the cheesecake. If using a cake pan, invert a serving plate over the pan and reinvert the cheesecake on the plate. If using a springform pan, remove the sides and set the bottom on a serving plate. Let cool completely.', time: '1 hour'},
                                               { step_count: 1, name: 'In a medium bowl, mix the blueberries with the 2 tablespoons sugar and the remaining 1 teaspoon lemon zest. If using fresh berries, crush a few with the back of a spoon to encourage juices to form. (Taste the fruit; if it\'s too tart, add another teaspoon of sugar.', time: ''},
                                               { step_count: 2, name: 'When ready to serve, dust the cheesecake with confectioners\' sugar, if using, and spoon the blueberries over the cheesecake. Cut and serve with a dollop of whipped cream or creme fraiche, if you like.', time: ''},
                                               { step_count: 3, name: 'My grandmother Alma made the best cheesecakes on the planet, including a white chocolate cheesecake that was to die for. My grandmother used Philly cream cheese, but I also add mascarpone to my cheesecake, for a flavor that is a little lighter and less sweet, yet still rich and delicious.', time: ''}
                                             ]
                                          },
{name: 'White Chocolate Sorbet', servings: 'N/A', creator_id: masahuru.id, avatar_img: 'app/assets/images/seeds/recipes/sorbet.bmp',
                    ingredients_attributes: [ { name: 'Water', quantity: '1 cup'},
                                              { name: 'Sugar', quantity: '1 cup + 2 tablespoons'},
                                              { name: 'Light corn syrup', quantity: '2 tablespoons'},
                                              { name: 'White chocolate, coarsely chopped', quantity: '8 ounces (225g)'}
                                            ],
                   cooking_steps_attributes: [ { step_count: 1, name: 'In a medium saucepan, combine the water, sugar, and corn syrup. Bring to a boil, stirring to dissolve the sugar. Remove from the heat and add the white chocolate. Let stand for 30 seconds, then whisk until smooth.', time: '10-15 min'},
                                               { step_count: 2, name: 'Let the sorbet base cool to room temperature. Whisk again and turn into an ice cream machine. Process according to the manufacturer’s instructions; it will be softly frozen. Transfer to a covered container and freeze for at least 4 hours or overnight until firm.', time: '4 hours'},
                                               { step_count: 3, name: 'You can also use this sorbet as a topping for a chocolate tart (as shown above), variety of fruit, etc.', time: ''}
                                             ]
                                          },
             ]


recipes.each do |recipe_params|
  avatar_img = recipe_params[:avatar_img]
  recipe_params.delete(:avatar_img)
  recipe = Recipe.new(recipe_params)
  file_path = File.join(Rails.root, avatar_img)
  recipe.avatar = File.open(file_path) if File.exists?(file_path)
  recipe.save!
end
