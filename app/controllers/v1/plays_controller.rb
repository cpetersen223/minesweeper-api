module V1
  class PlaysController < MainController
    before_action :set_game, only: %i[index create]
    before_action :set_play, only: %i[show update destroy]

    def index
      json_response @game.plays
    end

    def create
      play = @game.play!(play_params)
      json_response play, :created
    end

    def show
      json_response @play
    end

    def update
      @play.update!(play_params)
      head :no_content
    end

    def destroy
      @play.destroy!
      head :no_content
    end

    private

    def play_params
      params.permit :x, :y
    end

    def set_game
      @game = Game.includes(:plays).find params[:game_id]
    end

    def set_play
      @play = Play.includes(:game).find params[:id]
    end
  end
end
