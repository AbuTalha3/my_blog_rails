class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.includes(:comments, :author)
  end

  def show
    logger.debug(params)
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to user_posts_path, notice: 'Post was successfully created'
    else
      flash.now[:alret] = 'Error creating post'
      render.new
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
