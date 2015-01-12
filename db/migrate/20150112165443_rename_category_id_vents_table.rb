class RenameCategoryIdVentsTable < ActiveRecord::Migration
  def change
    remove_column :vents, :category_id
    add_column :vents, :categories_id, :integer
  end
end
