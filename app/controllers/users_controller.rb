class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.json { render :index, status: :ok }
      format.html
    end
  end

  def show
    @user = User.find(params['id'].to_i)
    respond_to do |format|
      format.json { render :show, status: :ok }
      format.html
    end
  end
end
