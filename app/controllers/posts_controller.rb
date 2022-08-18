class PostsController < ApplicationController
  def index
    params['page'] = 1 if params['page'].nil? || ((params['page'].to_i < 1))
    @user = User.find(params['user_id'].to_i)
    @posts = @user.posts.order(id: :desc).limit(2).offset((params['page'].to_i - 1) * 2)
    @page = params['page'].to_i
    @n_pages = (@user.posts_counter.to_f / 2).ceil
  end

  def new; end

  def create; end

  def show
    @post = Post.find(params['id'].to_i)
  end
end
