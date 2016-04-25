class AddCategoryIdColumnToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :category_id, :integer
    add_index :recipes, :category_id
  end

  def down
    remove_column :recipes, :category_id
    end
end
