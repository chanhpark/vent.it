class Word < ActiveRecord::Base
  has_many :word_counts
  validates :word, presence: true, uniqueness: true

  def total_count
    total = 0
    word_counts.each do |wc|
      total += wc.count
    end
    total
  end
end
