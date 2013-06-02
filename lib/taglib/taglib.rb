platform = RUBY_PLATFORM.split("-")[1]
if platform == 'mingw32'
  # Enable loading of pre-compiled libtag.dll
  lib = File.expand_path(File.dirname(__FILE__))
  ENV['PATH'] += (File::PATH_SEPARATOR + lib)
end

require './version'
require './base'
require './mpeg'
require './id3v1'
require './id3v2'
require './ogg'
require './vorbis'
require './flac'
require './mp4'