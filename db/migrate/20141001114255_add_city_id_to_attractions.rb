class AddCityIdToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :city_id, :integer
  end
end
