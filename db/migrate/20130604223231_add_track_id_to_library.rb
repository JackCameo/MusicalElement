class AddTrackIdToLibrary < ActiveRecord::Migration
  def change
    add_column :libraries, :track_id, :integer
  end
end
