class Word < ActiveRecord::Base
  has_many :wordcounts
  validates :word, presence: true, uniqueness: true
end
