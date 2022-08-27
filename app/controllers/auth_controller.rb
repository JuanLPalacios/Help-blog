class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_request

  def login
    @user = User.find_by(email: params[:email])
    if @user&.valid_password?(params[:password])
      token = JWT.encode({ user_id: @user.id, exp: 3_600_000 }, SECRET_KEY)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'unauthorized', email: @user.email }, status: :unauthorized
    end
  end
end
