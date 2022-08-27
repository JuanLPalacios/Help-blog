require 'jwt'

class ApplicationController < ActionController::Base
  include ActiveSupport::Concern
  before_action :authenticate_request
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  SECRET_KEY = Rails.application.secret_key_base

  protected

  def authenticate_request
    return unless request.format.json?

    token = request.headers['Authorization']
    token = header.split.last if token
    decoded = JWT.decode(token, SECRET_KEY)[0]
    decoded = HashWithIndifferentAccess.new decoded
    @current_user = User.find(decoded[:user_id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
