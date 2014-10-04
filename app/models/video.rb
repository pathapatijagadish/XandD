class Video < ActiveRecord::Base
	belongs_to :videoable, :polymorphic => true
	YT_LINK_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
 	validates :video_link, presence: true #, format: YT_LINK_FORMAT
	validate :custom_validations

	before_save :upload_video_to_youtube, :if => Proc.new { |obj| obj.video_link_changed? }
	
	def custom_validations
		errors.add(:video_link, "is not a valid format") unless video_link.match(YT_LINK_FORMAT)
	end
	
	def upload_video_to_youtube    
    	uid = video_link.match(YT_LINK_FORMAT)
    	if uid && uid[2]      
      		self.youtube_id = uid[2]

      		if self.youtube_id.to_s.length != 11
        		self.errors.add(:youtube_id, 'is invalid.')
        		false                      
      		end
    	else
      		begin
        		@yt_client ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)        
        		result = @yt_client.video_upload(video_link, :title => "#{self.title}",:description => "#{self.description}", :category => 'People',:keywords => %w[cool])
        		if result.present?
          			self.youtube_id = result.video_id.split(":").last                    
        		end
      			rescue Exception => e   
        		self.errors.add(:video_link,'URL is not valid')
      		end
    	end
  	end
end
