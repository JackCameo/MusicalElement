class RemoveArtistIdFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :artist_id
  end

  def down
    add_column :tracks, :artist_id, :integer
  end
end
