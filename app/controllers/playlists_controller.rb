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
    @playlist = @library.playlists.new

    # binding.pry
    # @tracks = current_user.library.tracks
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playlist }
    end
  end

  def show
    @playlist = Playlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playlist }
    end
  end

  def edit
  end

  def create
    # binding.pry
    @playlist = Playlist.new(params[:playlist])
    # binding.pry
    if @playlist.save
      format.html { redirect_to playlist_track_path(@playlist, @playlist), notice: 'Track was successfully created.' }
      format.json { render json: @playlist_track, status: :created, location: @playlist }
    else
      format.html { render action: "new" }
      format.json { render json: @playlist.errors, status: :unprocessable_entity }
    end
  end

  def destroy
  end
  def update
    binding.pry
  end 



  protected
  def load_library
    @library = Library.find(params[:library_id])
    @tracks = current_user.library.tracks
  end

end
