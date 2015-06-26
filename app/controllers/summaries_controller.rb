class SummariesController < ApplicationController
  def show
  	@post = Post.find(params[:post_id])
  	@summary = Summary.find(params[:id])
  	authorize @summary
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@summary = Summary.new
  	authorize @summary
  end

  def edit
  	@post = Post.find(params[:post_id])
  	@summary = Summary.find(params[:id])
  	@topic = Topic.find(params[:topic_id])
  	authorize @summary
  end

  def create
  	@summary = Summary.new(params.require(:summary).permit(:body))
  	@topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@summary.post = @post
  	authorize @summary
  	if @summary.save
  		flash[:notice] = "Summary was saved"
  		redirect_to [@topic, @post, @summary]
  	else
  		flash[:error] = "Summary was not saved. Please try again"
  		render :new
  	end
  end

  def update
  	@summary = Summary.find(params[:id])
  	@topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@summary.post = @post
  	authorize @summary
  	if @summary.update_attributes(params.require(:summary).permit(:body))
  		flash[:notice] = "Summary was updated"
  		redirect_to [@topic, @post, @summary]
  	else
  		flash[:error] = "Summary was not updated. Please try again"
  		render :new
  	end
  end
end
