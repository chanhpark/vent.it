class WordSerializer < ActiveModel::Serializer
  attributes :word, :count

  def count
    object.total_count
  end

  @words = Word.all
  def attributes
    array = []
    @words.each do |x|
      word = x.word
      count = x.total_count
      hash = Hash.new 0
      hash["name"] = word
      hash["size"] = count
      array << hash
    end
    array
  end
end
