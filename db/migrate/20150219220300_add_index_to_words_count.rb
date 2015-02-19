class AddIndexToWordsCount < ActiveRecord::Migration
  def change
    add_index :word_counts, :word_id
  end
end
