class VentsTable < ActiveRecord::Migration
  def change
    create_table :vents do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.timestamps null: false
    end
  end
end
