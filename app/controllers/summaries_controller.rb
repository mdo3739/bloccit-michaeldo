class SummariesController < ApplicationController
  def show
  	@post = Post.find(params[:post_id])
  	@summary = Summary.find(params[:id])
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@summary = Summary.new
  end

  def edit
  end

  def create
  	@summary = current_user.summaries.build(params.require(:summary).permit(:body))
  	@topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@summary.topic = @topic
  	@summary.post = @post
  	if @summary.save
  		flash[:notice] = "Summary was saved"
  		redirect_to [@topic, @post, @summary]
  	else
  		flash[:error] = "Summary was not saved. Please try again"
  		render :new
  	end
  end
end
