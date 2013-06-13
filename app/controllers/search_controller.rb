class SearchController < ApplicationController
  def search
    @results = Track.search(params[:search_box])
  end
end

