class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :item_rating

      t.timestamps
    end
  end
end
