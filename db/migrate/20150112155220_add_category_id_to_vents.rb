class AddCategoryIdToVents < ActiveRecord::Migration
  def change
    add_column :vents, :category_id, :integer
  end
end
