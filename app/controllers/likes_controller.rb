class LikesController < ApplicationController
  def create
    @like = Like.create(author: current_user, post_id: params['post_id'].to_i)
    respond_to do |format|
      format.html { redirect_to user_post_path(params['user_id'], params['post_id']) }
      format.json { render :show, status: :created, location: @like }
    end
  end
end
