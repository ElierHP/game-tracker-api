class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      reset_session
      session[:user_id] = user.id
      render json: 'success', status: :ok
    else
      render json: 'unauthorized', status: :unauthorized
    end
  end

  def destroy
    log_out
  end
end
