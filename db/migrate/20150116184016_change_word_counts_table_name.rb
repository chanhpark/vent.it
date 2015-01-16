class ChangeWordCountsTableName < ActiveRecord::Migration
  def change
    rename_table :wordcounts, :word_counts

  end
end
