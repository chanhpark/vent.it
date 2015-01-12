class CategoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :family
      t.string :life
      t.string :money
      t.string :relationships
      t.string :school
      t.string :work
      t.string :sports
      t.string :politics
      t.string :miscellaneous
      t.timestamps null: false
    end
  end
end
