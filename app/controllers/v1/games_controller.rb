module V1
  class GamesController < MainController
    before_action :set_game, only: %i[show update destroy]

    def index
      @games = Game.includes(:board, :plays).all
      json_response @games
    end

    def create
      @game = Game.create!(game_params)
      json_response @game, :created
    end

    def show
      json_response @game
    end

    def update
      @game.update!(game_params)
      head :no_content
    end

    def destroy
      @game.destroy!
      head :no_content
    end

    private

    def game_params
      if action_create?
        parameters = params.permit :player, board: %i[cols rows mines_percentage]
        if parameters.key? :board
          parameters[:board_attributes] = parameters.delete :board
        end
        p parameters
        parameters.permit!
      else
        params.permit(:player)
      end
    end

    def action_create?
      action_name == 'create'
    end

    def set_game
      # Include Board to draw the board and plays to draw it on the current "state"
      @game = Game.includes(:board, :plays).find params[:id]
    end
  end
end
