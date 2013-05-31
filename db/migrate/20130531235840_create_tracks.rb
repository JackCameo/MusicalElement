class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :name
      t.string :title
      t.string :tpath

      t.timestamps
    end
  end
end
