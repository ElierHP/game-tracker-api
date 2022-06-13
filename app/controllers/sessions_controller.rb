class SessionsController < ApplicationController
  def create
    session[:id] = 2
  end

  def destroy
  end
end
