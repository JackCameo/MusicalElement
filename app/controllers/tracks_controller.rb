class TracksController < ApplicationController
  before_filter :load_library

    def index
    @tracks = current_user.library.tracks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tracks }
    end
  end

  def new
    @track = Track.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @track }
    end
  end

  def create
    # @@trackdata
    # binding.pry
    @track = Track.new(params[:track])
    # @track.library = @library
    # @track.parse_id3
    # binding.pry
    @track.parse_id3(@track)
    respond_to do |format|
      # binding.pry
      if @track.save
        # binding.pry
        @tracklibrary = TrackLibrary.new
        @tracklibrary.track_id = @track.id
        @tracklibrary.library_id = @library.id
        @tracklibrary.save
        format.html { redirect_to library_track_path(@library, @track), notice: 'Track was successfully created.' }
        format.json { render json: @library_track, status: :created, location: @track }
      else
        format.html { render action: "new" }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @track = Track.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @track }
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    respond_to do |format|
      format.html { redirect_to library_tracks_url }
      format.json { head :no_content }
    end
  end

  protected
  def load_library
    # binding.pry
    @library = Library.find(params[:library_id])
  end

end
