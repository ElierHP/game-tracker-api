class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      render json: 'success', status: :ok
    else
      render json: 'unauthorized', status: :unauthorized
    end
  end

  def destroy
    log_out
  end
end
