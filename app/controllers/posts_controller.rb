class PostsController < ApplicationController
  def index
    params['page'] = 1 if params['page'].nil? || ((params['page'].to_i < 1))
    @user = User.find(params['user_id'].to_i)
    @posts = @user
      .includes(:comments, comments: [:author])
      .posts.order(id: :desc).limit(2).offset((params['page'].to_i - 1) * 2)
    @page = params['page'].to_i
    @n_pages = (@user.posts_counter.to_f / 2).ceil
  end

  def new
    @post = Post.new
    @user = User.find(params['user_id'].to_i)
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @user = current_user

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post
      .includes(:comments, comments: [:author])
      .find(params['id'].to_i)
    @user = User.find(params['user_id'].to_i)
    @current_user = current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
