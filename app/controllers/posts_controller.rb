class PostsController < ApplicationController
	
	 before_action :authenticate_user!, except: [:index]

	def index 
		@posts=Post.all
	end

	def new
		@post=Post.new
	end

	def create
		@post=Post.create(params[:post].permit(:title, :image, :tags_list))
		redirect_to '/posts'
	end
	
end
