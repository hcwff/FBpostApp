class PostsController < ApplicationController
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
		if current_user
			user = current_user
			user.facebook.put_wall_post(post.comment)
			post.save!
			redirect_to show_path
		end
		
	end
end
