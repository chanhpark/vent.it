class WordsController < ApplicationController
  def index
    @words = Word.all
    # @d3_words = ActiveModel::Serialzer.new(@words)
    # @users_json = ActiveModel::ArraySerializer.new(@users, root: :users, scope: current_user).to_json
    array = []
    @words.each do |x|
      word = x.word
      count = x.total_count
      hash = Hash.new 0
      hash["name"] = word
      hash["size"] = count
      array << hash
    end
    respond_to do |format|
      format.html
      format.json { render json: array }
    end
  end
end
