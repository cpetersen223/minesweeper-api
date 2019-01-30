class EmptyCellFinder
  def initialize(board, move)
    @board, @move = board, move
  end

  def find!
    @cells = @board.cells.empty.where(played: false, mines_neighbors: 0).select(:x, :y, :kind, :mines_neighbors)
    played_cell = @cells.find_by @move
    if played_cell&.mines_neighbors == 0
      # Todo: Empty cell logic here
    end
  end
end