class AddAlbumArtistToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :album_artist, :integer
  end
end
