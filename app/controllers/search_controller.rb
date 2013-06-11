class SearchController < ApplicationController
  def index
    @tracks = Track.search(params[:search])
  end
end
