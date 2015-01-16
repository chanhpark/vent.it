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
end
