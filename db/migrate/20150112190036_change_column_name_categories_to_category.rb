class ChangeColumnNameCategoriesToCategory < ActiveRecord::Migration
  def change
    rename_column :vents, :categories_id, :category_id
  end
end
