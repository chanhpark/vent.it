class Vent < ActiveRecord::Base
  paginates_per 10
  acts_as_votable
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :category
  validates :category_id, presence: true

  has_many :wordcounts

  def self.search(query)
    if query
      where(
      "plainto_tsquery(?) @@ " +
      "to_tsvector('english', LOWER(title) || ' ' || content)",
      query
      )
    else
      all
    end
  end

  def count_words(content)
    words = content.downcase.gsub(/[^a-z0-9\s\--]/,'').split(' ')
    wc = common_words(words)
    wc
  end

  def common_words(words)
    common_words =  File.read("stop_words.txt").split(' ')
    all_words = words
    word_count = Hash.new 0

    common_words.each do |word|
      all_words.delete(word)
    end

    all_words.each do |add_count|
      word_count[add_count] += 1
    end
    word_count
  end

end
