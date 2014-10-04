class AddAvatarToActivities < ActiveRecord::Migration
  def change
  	add_attachment :activities, :avatar
  end
end
