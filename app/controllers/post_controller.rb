class PostController < ApplicationController
	def index
		@post = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		
	end
	def create
		post = Post.new(params[:post])
		post.save!
		redirect_to show_path
	end
end
