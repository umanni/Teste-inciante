class CommentsController < ApplicationController
	before_action :set_post

	def create
		unless current_user
			flash[:alert] = "Please login or register first"
		 	redirect_to new_user_session_path
		else
		 	@comment = @post.comments.build(comment_params)
			@comment.user = current_user

			if @comment.save
				flash[:notice]  = "Comment has been created"
			else
				flash[:alert]  = "Comment has not been created"
			end
			redirect_to post_path(@post)
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end

		def set_post
			@post = Post.friendly.find(params[:post_id])
		end
end
