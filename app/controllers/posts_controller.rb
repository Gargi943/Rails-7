class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
  		render turbo_stream: turbo_stream.append('test', partial: 'create', locals: { post: @post } )
		else
		  # Handle errors
		end
	end

	private

	def post_params
		params.require(:post).permit(:title)
	end
end