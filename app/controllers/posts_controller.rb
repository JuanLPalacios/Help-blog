class PostsController < ApplicationController
  def index
    params['page'] = 1 if params['page'].nil? || ((params['page'].to_i < 1))
    @user = User.find(params['user_id'].to_i)
    @posts = @user.posts
      .includes(:comments, comments: [:author])
      .order(id: :desc).limit(2).offset((params['page'].to_i - 1) * 2)
    @page = params['page'].to_i
    @n_pages = (@user.posts_counter.to_f / 2).ceil
    respond_to do |format|
      format.json { render :index, status: :ok }
      format.html
    end
  end

  def new
    @post = Post.new
    @user = User.find(params['user_id'].to_i)
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(current_user, @post) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params['id'].to_i)
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(params[:user_id]), notice: 'Post deleted.' }
      format.json { head :no_content }
    end
  end

  def show
    @post = Post
      .includes(:comments, comments: [:author])
      .find(params['id'].to_i)
    @user = User.find(params['user_id'].to_i)
    @current_user = current_user
    respond_to do |format|
      format.json { render :show, status: :ok }
      format.html
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
