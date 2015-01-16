class ChangeColumnTypeWordsToString < ActiveRecord::Migration
  def change
    remove_column :words, :word, :text, null: false
  end
end
