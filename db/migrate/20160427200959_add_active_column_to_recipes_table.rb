class AddActiveColumnToRecipesTable < ActiveRecord::Migration
  def up
    add_column :recipes, :active, :boolean, :default => true
  end

  def down
    remove_column :recipes, :active
  end
end