class SessionsController < ApplicationController

  # POST /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      render json: 'success', status: :ok
    else
      render json: 'unauthorized', status: :unauthorized
    end
  end

  # DELETE /logout
  def destroy
    log_out
  end
end
