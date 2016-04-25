class CreateClucksTable < ActiveRecord::Migration
  def change
    create_table :clucks do |t|
      t.string :title
      t.text :cluck
      t.datetime :created_at
    end
  end
end
