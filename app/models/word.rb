class Word < ActiveRecord::Base
  has_many :word_counts
  validates :word, presence: true, uniqueness: true

  def size
    total = 0
    word_counts.each do |value|
      total += value.count
    end
    total
  end

  def name
    word
  end

  def as_json(options={})
    super(only: [],methods: [:name, :size])
  end

end
