class AddOriginalRecipeToRecipe < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.references :original_recipe, index: true
    end
  end
end
