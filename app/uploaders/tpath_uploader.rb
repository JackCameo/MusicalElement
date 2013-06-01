# encoding: utf-8
require 'taglib'
class TpathUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
    # @trackpath = storage.uploader.to_s
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # process :track_location

  # def track_location
  #   # binding.pry
  #   @tracklocation = storage.uploader.to_s
  #   binding.pry
  #   return @tracklocation    
  # end
  process :read_id3

  def read_id3
    x = "public"+storage.uploader.to_s
    TagLib::MPEG::File.open(x) do |f|
    tag = f.id3v2_tag
    @trackdata = {}

    # Read basic attributes
    @trackdata[:title] = tag.title
    @trackdata[:artist] = tag.artist
    @trackdata[:track] = tag.track
    @trackdata[:year] = tag.year
    @trackdata[:album] = tag.album
    @trackdata[:genre] = tag.genre
    # binding.pry
    # Access all frames
    tag.frame_list.size

    # Track frame
    # track = tag.frame_list('TRCK').first

    properties = fileref.audio_properties
    @trackdata[:length] = properties.length

    # Attached picture frame
    cover = tag.frame_list('APIC').first
    cover.mime_type
    cover.picture
    # Track.parse_id3
    binding.pry
    return @trackdata
    
    end
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
