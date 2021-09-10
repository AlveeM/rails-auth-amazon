class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authorize

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    @current_user_type = @current_user.class
    if !@current_user
      render json: { errors: ["unauthorized"] }, status: :unauthorized
    end
  end
end
