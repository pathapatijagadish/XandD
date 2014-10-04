class AddAvatarToBanners < ActiveRecord::Migration
  def change
  	add_attachment :banners, :avatar
  end
end
