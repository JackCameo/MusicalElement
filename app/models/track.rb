require 'taglib'
require "mp3info"
class Track < ActiveRecord::Base
  attr_accessible :name, :title, :tpath, :track_number, :artist, :album_artist, :year, :genre, :bpm, :length, :size, :user_id
  
  mount_uploader :tpath, TpathUploader

  belongs_to :user
  # belongs_to :library
  has_many :libraries, :through => :track_library
  has_many :track_library



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
    data[:artist] = f.tag2["TPE1"]
    data[:album_artist] = f.tag2["TPE2"]
    data[:year] = f.tag2["TYER"]
    data[:track_number] = f.tag2["TRCK"]
    data[:genre] = f.tag2["TCON"]
    data[:length] = f.length.to_i
    data[:size] = x.size * 1024
    # # binding.pry
    # # Access all frames
    # tag.frame_list.size

    # # Track frame
    # track = tag.frame_list('TRCK').first
    # @trackdata[:length] = track.to_s

    # # Attached picture frame
    # cover = tag.frame_list('APIC').first
    # cover.mime_type
    # cover.picture
    # binding.pry
  end
end

end
