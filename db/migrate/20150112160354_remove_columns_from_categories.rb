class RemoveColumnsFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :family
    remove_column :categories, :life
    remove_column :categories, :money
    remove_column :categories, :relationships
    remove_column :categories, :school
    remove_column :categories, :work
    remove_column :categories, :sports
    remove_column :categories, :politics
    remove_column :categories, :miscellaneous
  end
end
