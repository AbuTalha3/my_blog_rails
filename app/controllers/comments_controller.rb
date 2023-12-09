class CommentsController < ApplicationController
  def new
    @user = Post.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = @user.Comments.build(comment_params)
    comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Comment not created successfully'
      puts @comment.errors.full_messages
      render :new
    end

    redirect_to users_post_path(params[:user_id], @comment.post_id)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
