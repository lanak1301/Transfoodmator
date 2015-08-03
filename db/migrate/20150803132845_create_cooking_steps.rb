class CreateCookingSteps < ActiveRecord::Migration
  def change
    create_table :cooking_steps do |t|
      t.integer :step_count
      t.string :name
      t.time :time
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
