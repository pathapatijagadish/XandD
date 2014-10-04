class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.boolean :extreme_luxury
      t.text :address
      t.text :description
      t.string :phone_number
      t.string :checkin
      t.string :checkout
      t.text :facilities
      t.text :room_types
      t.text :usp
      t.string :things_to_do
      t.integer :rating

      t.timestamps
    end
  end
end
