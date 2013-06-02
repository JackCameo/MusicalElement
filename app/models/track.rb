require 'taglib'
require "mp3info"
class Track < ActiveRecord::Base
  attr_accessible :name, :title, :tpath
  
  mount_uploader :tpath, TpathUploader

  # def initialize(data)
  #   # binding.pry
  # end

  def parse_id3(data)
    x = "public"+tpath.to_s
    binding.pry
    TagLib::MPEG::File.open(x) do |f|
    # binding.pry
    tag = f.id3v2_tag
    binding.pry
    # @trackdata = {}

    # Read basic attributes
    data[:title] = tag.title
    # @trackdata[:artist] = tag.artist
    # @trackdata[:track] = tag.track
    # @trackdata[:year] = tag.track
    # @trackdata[:track] = tag.track
    # @trackdata[:genre] = tag.genre
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
    binding.pry
  end
end

end
