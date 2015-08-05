class AddCreatorToRecipes < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.references :creator, index: true
    end
  end
end
