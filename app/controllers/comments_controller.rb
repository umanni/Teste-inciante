class CommentsController < ApplicationController
	before_action :set_post

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user = current_user

		if @comment.save
			flash[:notice]  = "Comment has been created"
		else
			flash.now[:alert]  = "Comment has been created"
		end

		redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end

		def set_post
			@post = Post.friendly.find(params[:post_id])
		end
end
