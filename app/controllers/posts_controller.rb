class PostsController < ApplicationController

  def show
  	@post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])

    @comment = Comment.new
    @comments = @post.comments.all
    authorize @comment

    @summary = @post.summary
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @post = current_user.posts.build(post_params)
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
      flash[:notice] = "Post was deleted."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting your post. Please try again."
      redirect_to :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :pic)
  end
end
