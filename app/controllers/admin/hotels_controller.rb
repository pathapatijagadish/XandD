class Admin::HotelsController < ApplicationController
  layout "admin"
	before_action :set_admin_hotel, only: [:show, :edit, :update, :destroy]

  	def index
    	@hotels = Hotel.all
  	end


  	def show
  	end

   	def new
    	@hotel = Hotel.new
  	end


	def edit
	end

	def create
    	@hotel = Hotel.new(hotel_params)
	    if @hotel.save
	     	flash[:notice] = 'hotel was successfully created.' 
        	redirect_to admin_hotels_url
      	else
        	flash[:notice] = 'hotel was not successfully created.'
        	render "new"
        end

  	end


	def update
		if @hotel.update(hotel_params)
	        flash[:notice] = 'hotel was successfully updated.' 
        	redirect_to admin_hotels_url
      	else
        	flash[:notice] = 'hotel was not successfully updated.'
        	render "new"
	    end
	end


	def destroy
	    @hotel.destroy
	    respond_to do |format|
	      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

  	private

    def set_admin_hotel
      @hotel =Hotel.find(params[:id])
    end


    def hotel_params
      params.require(:hotel).permit(:name, :extreme_luxury, :address, :description, :phone_number, :checkin, :checkout, :facilities, :room_types, :usp, :things_to_do, :rating,:avatar,images_attributes: [:id,:avatar,:imageable_id,:imageable_type,:_destroy],videos_attributes: [:id,:youtube_id,:video_link,:videoable_id,:videoable_type,:_destroy])
    end
end
