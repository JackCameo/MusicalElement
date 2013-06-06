class CreateTrackLibraries < ActiveRecord::Migration
  def change
    create_table :track_libraries do |t|
      t.integer :library_id
      t.integer :track_id

      t.timestamps
    end
  end
end
