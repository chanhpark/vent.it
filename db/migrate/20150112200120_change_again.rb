class ChangeAgain < ActiveRecord::Migration
  def change
    rename_table :categorys, :category
  end
end
