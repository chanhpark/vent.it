def word_count
  @words = ""
  Vent.all.each do |vent|
    @words += vent.content
  end

  hash = Hash.new 0
  @array_of_words = @words.downcase.gsub(/[^a-z0-9\s\--]/,'').split(" ")

  common_words = File.read("stop_words.txt")

  common_words.each do |word|
    @array_of_words.delete(word)
  end

  @array_of_words.each do |word|
    hash[word] += 1
  end
  hash.sort_by { |word, count| -count }
end
