# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.destroy_all
User.destroy_all

users = [ {name: 'Jenny', email: 'jenny@hello.com', password: 'jenny@hello.com', avatar_img: 'app/assets/images/logo.jpg'},
           {name: 'Kenny', email: 'kenny@hello.com', password: 'kenny@hello.com', avatar_img: 'app/assets/images/seeds/users/logo.jpg'},
            {name: 'Jessy', email: 'jessy@hello.com', password: 'jessy@hello.com', avatar_img: 'app/assets/images/seeds/users/logo.jpg'}]
recipes = [ {name: 'Burger', servings: '4', creator_id: 1,
                       ingredients_attributes: [ { name: 'bun', quantity: '1 piece'},
                                      { name: 'patty', quantity: '1 piece'}],
                       cooking_steps_attributes: [ { step_count: 1, name: 'Grill patty', time: '10 min'},
                                        { step_count: 2, name: 'Put patty on the bun', time: '2 min'}]
                       },
             {name: 'Noodles', servings: '1', creator_id: 2,
                         ingredients_attributes: [ { name: 'Noodles', quantity: '1 bunch'},
                                        { name: 'Italian tomato sauce', quantity: '2 cups'}],
                         cooking_steps_attributes: [ { step_count: 1, name: 'Boil noodles', time: '6-8 min'},
                                          { step_count: 2, name: 'Add souce', time: '2 min'}]
                         },
             {name: 'Walnut Oatmeal', servings: '1', creator_id: 3,
                         ingredients_attributes: [ { name: 'Oatmeal', quantity: '2 cups'},
                                        { name: 'Walnuts', quantity: '1 oz'},
                                        { name: 'Water', quantity: '2 cups'}],
                         cooking_steps_attributes: [ { step_count: 1, name: 'Boil water', time: '3 min'},
                                          { step_count: 2, name: 'Submerge oatmeal in hot water', time: '4 min'},
                                          { step_count: 3, name: 'Add walnuts to oatmeal', time: '1 min'}]
                         }]

users.each do |user_params|
  avatar_img = user_params[:avatar_img]
  user_params.delete(:avatar_img)
  user = User.new(user_params)
  file_path = File.join(Rails.root, avatar_img)
  user.avatar = File.open(file_path) if File.exists?(file_path)
  user.save!
end

recipes.each do |recipe_params|
  Recipe.create(recipe_params)
end
