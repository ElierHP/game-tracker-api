class UsersController < ApplicationController
    before_action :set_user, only: %i[ show update destroy ]

    # GET /users/1
    def show
        render json: @user
    end

    # POST /users
    def create
        @user = User.new(user_params)

        if @user.save
          log_in @user
          render json: 'success', status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      
    # PATCH/PUT /users/1
    def update
        if @user.update(user_params)
        render json: @user
        else
        render json: @user.errors, status: :unprocessable_entity
        end
    end

    # DELETE /users/1
    def destroy
        log_out
        @user.destroy
    end

      private 
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def set_user
        @user = User.find(params[:id])
      end
end
