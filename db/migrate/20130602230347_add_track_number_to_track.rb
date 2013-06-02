class AddTrackNumberToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :track_number, :integer
    add_column :tracks, :artist, :string
    add_column :tracks, :album_artist, :string
    add_column :tracks, :year, :integer
    add_column :tracks, :genre, :string
    add_column :tracks, :bpm, :integer
    add_column :tracks, :length, :integer
    add_column :tracks, :size, :string
  end
end
