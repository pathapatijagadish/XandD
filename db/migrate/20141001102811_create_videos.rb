class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :youtube_id
      t.string :video_link
      t.integer :videoable_id
      t.string :videoable_type

      t.timestamps
    end
  end
end
