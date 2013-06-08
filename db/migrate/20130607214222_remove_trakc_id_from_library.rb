class RemoveTrakcIdFromLibrary < ActiveRecord::Migration
  def up
    remove_column :libraries, :trakc_id
  end

  def down
    add_column :libraries, :trakc_id, :integer
  end
end
