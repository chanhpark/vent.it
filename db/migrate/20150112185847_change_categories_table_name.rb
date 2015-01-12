class ChangeCategoriesTableName < ActiveRecord::Migration
  def change
    rename_table :categories, :category
  end
end
