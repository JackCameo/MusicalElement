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
    # @artist = Artist.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @track }
    end
  end

  def create
    # binding.pry
    @track = Track.new(params[:track])
    # binding.pry
    @track.libraries << @library
    @track.parse_id3(@track)
    # binding.pry
    # @track.update_attributes(@track[:artists_attributes])
    @artist = []
    @track.name[:artists].each do |i|
      # binding.pry
        if Artist.find_by_name(i[:name]) == nil
          a = Artist.new(:name => i[:name])
          a.save
          @artist << a
          # binding.pry
        else
          @artist << Artist.find_by_name(i[:name])
      end
    end
    @artist << Artist.find_by_name(@track[:album_artist])    
    # binding.pry
    # @track.update_attributes(@track[:name])
    # binding.pry
    # @track.artists << @artist
    # binding.pry
    # @artist = @track.artist.build
    # @artist = Artist.new(@track[:artists_attributes])
    # binding.pry
    respond_to do |format|
      if @track.save
        @artist.each do |a|
          # binding.pry
          @artist_track = ArtistTrack.new(:album_artist => @artist.last.id, :artist_id => a.id, :track_id => @track.id)
          @artist_track.save
          # binding.pry
        end
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
    @library = Library.find(params[:library_id])
  end

end
