class AddAvatarToHotels < ActiveRecord::Migration
  def change
  	add_attachment :hotels, :avatar
  end
end
