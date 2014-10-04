class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :timing
      t.integer :rating

      t.timestamps
    end
  end
end
