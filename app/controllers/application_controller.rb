class ApplicationController < ActionController::API
    def log_in(user)
        reset_session
        session[:user_id] = user.id
    end
    
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def authorize_user
        render json: 'unauthorized', status: :unauthorized unless logged_in?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
