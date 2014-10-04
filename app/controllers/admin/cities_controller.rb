class Admin::CitiesController < ApplicationController
	layout "admin"
	before_action :set_admin_city, only: [:show, :edit, :update, :destroy]

	def index
	   @cities = City.all
	 end


	def show
	end

	def new
	    @city = City.new
	end

	def edit
	end

	def create
		#render :text=>params and return false
	    @city = City.new(admin_city_params)
	    if @city.save
	        flash[:notice] = 'city was successfully created.' 
        	redirect_to admin_cities_url
      	else
        	flash[:notice] = 'city was not successfully created.'
        	render "new"
        end
	end

	def update
	    if @city.update(admin_city_params)
	        flash[:notice] = 'city was successfully updated.' 
        	redirect_to admin_cities_url
      	else
        	flash[:notice] = 'city was not successfully updated.'
        	render "new"
        end
    end

	def destroy
	    @city.destroy
	    respond_to do |format|
	      format.html { redirect_to admin_cities_url, notice: 'City was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

	private

	def set_admin_city
	    @city = City.find(params[:id])
	end


	def admin_city_params
	    params.require(:city).permit(:name, :description, :destination,:avatar,attractions_attributes: [:name,:_destroy])
	end
end

