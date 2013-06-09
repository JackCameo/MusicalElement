require 'taglib'
require "mp3info"
class Track < ActiveRecord::Base
  attr_accessible :name, :title, :tpath, :track_number, :artist, :album_artist, :year, :genre, :bpm, :length, :size, :user_id, :artists_attributes
  
  mount_uploader :tpath, TpathUploader

  belongs_to :user
  # belongs_to :playlist
  # belongs_to :artist
  # belongs_to :library
  has_many :libraries, :through => :track_libraries
  has_many :track_libraries
  has_many :playlists, :through => :playlist_tracks
  has_many :playlist_tracks
  has_many :artists, :through => :artist_tracks
  has_many :artist_tracks

  accepts_nested_attributes_for :artists



  def parse_id3(data)
    x = "public"+tpath.to_s
    # binding.pry
    Mp3Info.open(x) do |f|
    # TagLib::MPEG::File.open(x) do |f|
    # binding.pry
    # tag = f.id3v2_tag
    # binding.pry
    # @trackdata = {}

    # Read basic attributes
    data[:title] = f.tag2["TIT2"]
    data[:bpm] = f.tag2["TBPM"]
    data[:artists_attributes] = f.tag2["TPE1"]
    data[:album_artist] = f.tag2["TPE2"]
    data[:year] = f.tag2["TYER"]
    data[:track_number] = f.tag2["TRCK"]
    data[:genre] = f.tag2["TCON"]
    data[:length] = f.length.to_i
    data[:size] = x.size * 1024
    # binding.pry
    data[:artists_attributes] = data[:artists_attributes].split("/")
    # data[:artist] = {:name => data[:artist]}
    # # Access all frames
    # tag.frame_list.size

    # # Track frame
    # track = tag.frame_list('TRCK').first
    # @trackdata[:length] = track.to_s

    # # Attached picture frame
    # cover = tag.frame_list('APIC').first
    # cover.mime_type
    # cover.picture
    self.parse_artist(data)
    # binding.pry
  end
end

  def parse_artist(track)
    @y = []
    track.artists_attributes.each do |artist|
      x = {}      
      x[:name] = artist
      @y << x
    end
    track[:artists_attributes] = {}
    track[:artists_attributes] = {:artist=>@y}
  end

end
