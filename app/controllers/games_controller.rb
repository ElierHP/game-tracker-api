class GamesController < ApplicationController
  before_action :get_user
  before_action :set_game, only: %i[ show update destroy ]
 
  # GET users/:id/games
  def index
    @games = @user.games

    render json: @games
  end

  # GET users/:id/games/:id
  def show
    render json: @game
  end

  # POST users/:id/games
  def create
    @game = @user.games.build(game_params)

    if @game.save
      render json: @game, status: :created, location: @user_game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT users/:id/games/:id
  def update
    if @game.update(game_params)
      render json: @game, status: :ok, location: @user_game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE users/:id/games/:id
  def destroy
    @game.destroy
  end

  private
    def get_user
      @user = User.find(params[:user_id])
    end

    def set_game
      @game = @user.games.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:title, :platform, :owned, :user_id)
    end
end
