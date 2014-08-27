class PostsController < ApplicationController
	
	 before_action :authenticate_user!, except: [:index]

	def index 
		@posts=Post.all

	end

	def new
		@post=Post.new
	end

	def create
		@post=current_user.posts.create(params[:post].permit(:title, :image, :tags_list, :price))
		if current_user.id == @post.user_id
		hello_world
		end
		redirect_to '/posts'
	end
	

	def hello_world
    Pusher['test_channel'].trigger('my_event', {
      message: 'A new picture have been updated'
    })
  end


end
