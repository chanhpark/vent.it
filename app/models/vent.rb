class Vent < ActiveRecord::Base
  paginates_per 10
  acts_as_votable
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :category
  validates :category_id, presence: true
end
