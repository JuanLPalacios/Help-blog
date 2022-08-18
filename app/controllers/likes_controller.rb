class LikesController < ApplicationController
  def create
    Like.create(author: current_user, post_id: params['post_id'].to_i)
    redirect_to user_post_path(params['user_id'], params['post_id'])
  end
end
