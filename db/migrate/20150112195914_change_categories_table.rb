class ChangeCategoriesTable < ActiveRecord::Migration
  def change
    rename_table :category, :categorys
  end
end
