class ChangewordcountTableName < ActiveRecord::Migration
  def change
    rename_table :wordcount, :wordcounts
  end
end
