class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create
  
  def create
    user = User.find_by(username: params[:username])
    # authenticate method is provided by has_secure_password macro in User model
    if user && user.authenticate(params[:password])
      # set session
      session[:user_id] = user.id
      render json: user
    else
      # send error
      render json: { errors: ["wrong username or password"] }, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
