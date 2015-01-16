class WordCount < ActiveRecord::Base
  belongs_to :vent
  belongs_to :word
end
