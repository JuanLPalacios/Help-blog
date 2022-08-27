class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post_id = params[:post_id].to_i
    @comment.save
    puts @comment
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  def destroy
    @comment = Comment.find(params['id'].to_i)
    @comment.destroy
    redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
