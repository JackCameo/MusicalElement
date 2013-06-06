class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlists }
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

end
