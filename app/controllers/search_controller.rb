class SearchController < ApplicationController
  def search
    @results = Track.search(params[:search])
  end
end

