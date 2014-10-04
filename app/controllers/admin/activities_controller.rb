  class Admin::ActivitiesController < ApplicationController
  layout "admin"
	before_action :set_activity, only: [:show, :edit, :update, :destroy]

  	def index
    	@activities = Activity.all
  	end

  	def show
  	end

  	def new
      @activity = Activity.new
    end

    def edit
    end	

    def create
      #render :text=>params and return false
    	@activity = Activity.new(activity_params)

	    if @activity.save
       		flash[:notice] = 'Activity was successfully created.' 
        	redirect_to admin_activities_url
      	else
        	flash[:notice] = 'Activity was not successfully created.'
        	render "new"
        end
  	end

  	def update
      	if @activity.update(activity_params)
        	flash[:notice] = 'Activity was successfully updated.' 
        	redirect_to admin_activities_url
      	else
        	flash[:error] = 'Activity was not successfully updated.'
        	render "edit"
      	end
    end

  	def destroy
    	if @activity.destroy
      		flash[:notice] = 'Activity was successfully deleted.' 
      		redirect_to admin_activities_url
    	end
  	end

  private

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :description, :price, :timing,:avatar, :rating,images_attributes: [:id,:avatar,:imageable_id,:imageable_type,:_destroy],videos_attributes: [:id,:youtube_id,:video_link,:videoable_id,:videoable_type,:_destroy])
    end
end
