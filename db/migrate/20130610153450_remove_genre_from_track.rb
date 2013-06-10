class RemoveGenreFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :genre
  end

  def down
    add_column :tracks, :genre, :string
  end
end
