class AddIndexToVents < ActiveRecord::Migration
  def change
    add_index :vents, :title
    add_index :vents, :content
    add_index :vents, :category_id
  end
end
