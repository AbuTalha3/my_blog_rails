class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    @post = Post.find_by(id: params[:post_id])

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = 'Comment not created successfully'
      puts @comment.errors.full_messages
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
