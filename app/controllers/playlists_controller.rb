class PlaylistsController < ApplicationController
  before_filter :load_library

  def index
    @playlists = Playlist.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlists }
    end
  end

  def new
    # binding.pry
    @playlist = Playlist.new
    @tracks = current_user.library.tracks
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playlist }
    end
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  protected
  def load_library
    # binding.pry
    @library = Library.find(params[:library_id])
  end

end
