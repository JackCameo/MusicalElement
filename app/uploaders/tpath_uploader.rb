# encoding: utf-8

class TpathUploader < CarrierWave::Uploader::Base
require 'taglib'
require "mp3info"

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file

  # before :store, :remember_cache_id
  # after :store, :delete_tmp_dir

  #   def remember_cache_id(new_file)
  #     @cache_id_was = cache_id
  #   end
    
  #   def delete_tmp_dir(new_file)
  #     # make sure we don't delete other things accidentally by checking the name pattern
  #     if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
  #       FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
  #     end
  #   end
  # end
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
  # process :read_id3

  # def read_id3
  #   x = "public"+storage.uploader.to_s
  #   TagLib::MPEG::File.open(x) do |f|
  #   tag = f.id3v2_tag
  #   @track = Track.new

  #   # Read basic attributes
  #   @track[:title] = tag.title
  #   # @track[:artist] = tag.artist
  #   # @track[:track] = tag.track
  #   # @track[:year] = tag.year
  #   # @track[:album] = tag.album
  #   # @track[:genre] = tag.genre
  #   # # binding.pry
  #   # # Access all frames
  #   # # tag.frame_list.size

  #   # # Track frame
  #   # # track = tag.frame_list('TRCK').first

  #   # properties = f.audio_properties
  #   # @track[:length] = properties.length
  #   # @track[:bitrate] = properties.bitrate

  #   # # Attached picture frame
  #   # cover = tag.frame_list('APIC').first
  #   # cover.mime_type
  #   # cover.picture
  #   # Track.parse_id3
  #   # binding.pry
  #   # return @trackdata
    
  #   end
  # end
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
