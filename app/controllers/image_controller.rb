class ImageController < ApplicationController
	def index
		@image = Image.all
	end

	def new
		@image = Image.new
		@image.save!
		redirect_to show_path


	end

	def show
		@uploadImg = Image.last
	end

	def create
		image = Image.new(params[:image])
		image.save!
		redirect_to show_path
	end
end
