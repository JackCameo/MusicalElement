class SearchController < ApplicationController
  def search
    @results = Track.search(params[:search_box])
    # binding.pry
  end
end

