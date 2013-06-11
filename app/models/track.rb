require 'taglib'
require "mp3info"
class Track < ActiveRecord::Base
  attr_accessible :name, :title, :tpath, :track_number, :year, :bpm, :length, :size, :user_id, :artists_attributes, :album_attributes
  attr_accessible :genre_attributes, :album_id, :genre_id

  mount_uploader :tpath, TpathUploader

  define_index do
    indexes :name
    indexes :title
    indexes :bpm
  end

  belongs_to :user
  # belongs_to :playlist
  # belongs_to :artist
  # belongs_to :library
  has_one :album
  has_one :genre

  has_many :libraries, :through => :track_libraries
  has_many :track_libraries
  has_many :playlists, :through => :playlist_tracks
  has_many :playlist_tracks
  has_many :artists, :through => :artist_tracks
  has_many :artist_tracks

  # has_one :album_artist, :foreign_key => :artist_id, :primary_key => :artist_id
  # belongs_to :album_artist, :foreign_key => :artist_id, :primary_key => :artist_id

  accepts_nested_attributes_for :artists
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :genre



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
    data[:name] = f.tag2["TPE1"]
    # data[:album_artist] = f.tag2["TPE2"]
    data[:year] = f.tag2["TYER"]
    data[:track_number] = f.tag2["TRCK"]
    data[:genre_attributes] = f.tag2["TCON"]
    data[:length] = f.length.to_i
    data[:size] = x.size * 1024
    # binding.pry
    data[:name] = data[:name].split("/")
    data[:album_attributes] = f.tag2["TALB"]
    binding.pry
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
    track.name.each do |artist|
      x = {}
      x[:name] = artist
      @y << x
    end
    track[:name] = {}
    # track[:name] = {:artists=>@y}
    track[:artists_attributes] = @y
    # binding.pry
  end

end
