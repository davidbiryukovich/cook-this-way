class CreateRecipesIngredientsTable < ActiveRecord::Migration
  def up
    create_table :recipes_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :amount
    end

    add_index :recipes_ingredients, :recipe_id
    add_index :recipes_ingredients, :ingredient_id
  end

  def down
    drop_table :recipes_ingredients
  end
end
