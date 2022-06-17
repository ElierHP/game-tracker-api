class GamesController < ApplicationController
  before_action :authorize_user
  before_action :set_game, only: %i[ show update destroy ]
 
  # GET /games
  def index
    @games = current_user.games

    render json: @games
  end

  # GET games/:id
  def show
    render json: @game
  end

  # POST /games
  def create
      @game = current_user.games.build(game_params)
      if @game.save
        render json: @game, status: :created
      else
        render json: @game.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /games/:id
  def update
    if @game.update(game_params)
      render json: @game, status: :ok
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/:id
  def destroy
    @game.destroy
  end

  private
    def set_game
      @game = current_user.games.find_by(id: params[:id]) || nil
      render json: 'Error: game does not exist.' if @game.nil?
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:title, :platform, :completed, :user_id)
    end
    
end
