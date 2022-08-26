class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post_id = params[:post_id].to_i
    @comment.save
    respond_to do |format|
      format.html { redirect_to user_post_path(params[:user_id], params[:post_id]) }
      format.json { render :show, status: :created, location: @comment }
    end
  end

  def destroy
    @comment.destroy
    edirect_to user_post_path(params[:user_id], params[:post_id]), notice: "Comment deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
