class AddWordCloudTable < ActiveRecord::Migration
  def change
    create_table :wordcount do |t|
      t.integer :vent_id, null: false
      t.integer :word_id, null: false
      t.integer :count, null: false
      t.timestamps
    end
  end
end
