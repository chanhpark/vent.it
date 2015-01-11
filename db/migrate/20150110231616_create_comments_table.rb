class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :vent_id
      t.integer :user_id
      t.text :reply, null: false
      t.timestamps
    end
  end
end
