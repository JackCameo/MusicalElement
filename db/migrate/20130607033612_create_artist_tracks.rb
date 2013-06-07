class CreateArtistTracks < ActiveRecord::Migration
  def change
    create_table :artist_tracks do |t|
      t.integer :artist_id
      t.integer :track_id
      t.integer :album_artist

      t.timestamps
    end
  end
end
