class Admin::BannersController < ApplicationController
  layout "admin"
	before_action :set_banner, only: [:show, :edit, :update, :destroy]

  	def index
    	@banners = Banner.all
  	end

  	def show
  	end

  	def new
      @banner = Banner.new
    end

    def edit
    end

    def create
      #render :text=>params and return false
    	@banner = Banner.new(banner_params)

	    if @banner.save
       		flash[:notice] = 'Banner was successfully created.' 
        	redirect_to admin_banners_url
      	else
        	flash[:notice] = 'Banner was not successfully created.'
        	render "new"
        end
  	end

  	def update
      	if @banner.update(banner_params)
        	flash[:notice] = 'Banner was successfully updated.' 
        	redirect_to admin_banners_url
      	else
        	flash[:error] = 'Banner was not successfully updated.'
        	render "edit"
      	end
    end

  	def destroy
    	if @banner.destroy
      		flash[:notice] = 'Banner was successfully deleted.' 
      		redirect_to admin_banners_url
    	end
  	end

  private

    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params.require(:banner).permit(:avatar)
    end
end
