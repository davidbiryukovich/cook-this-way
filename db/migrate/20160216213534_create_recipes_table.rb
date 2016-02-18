class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.integer :servings
      t.integer :total_time
    end
  end
end
