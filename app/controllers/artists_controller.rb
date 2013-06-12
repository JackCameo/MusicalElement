class ArtistsController < ApplicationController
  # before_filter :load_library

    def index
    # binding.pry
    @artists = current_user.library.tracks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end


  # def load_library
  #   binding.pry
  #   @library = Library.find(params[:library_id])
  # end


end
