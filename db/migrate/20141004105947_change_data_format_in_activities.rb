class ChangeDataFormatInActivities < ActiveRecord::Migration
  def change
  	change_column :activities, :price, :string
  end
end
