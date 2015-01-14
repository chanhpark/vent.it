class SearchController < ApplicationController
  def index
    @results = Vent.search(params[:query])
  end
end
