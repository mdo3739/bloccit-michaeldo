class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@topic = @post.topic
		@comment = current_user.comments.build(comment_params)
		@comment.post = @post
		authorize @comment
		if @comment.save
			flash[:notice] = "Your comment was posted"
			redirect_to [@topic, @post]
		else
			flash[:error] = "There was an error saving your comment.  Please try again."
			redirect_to [@topic, @post]
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@topic = @post.topic
		@comment = Comment.find(params[:id])
		authorize @comment
		if @comment.destroy
			flash[:notice] = "Comment deleted."
		else
			flash[:error] = "There was an error deleting your comment. Please try again."
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
