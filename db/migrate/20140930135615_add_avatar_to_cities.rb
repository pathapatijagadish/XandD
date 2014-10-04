class AddAvatarToCities < ActiveRecord::Migration
  def change
  	add_attachment :cities, :avatar
  end
end
