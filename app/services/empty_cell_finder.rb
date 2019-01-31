class EmptyCellFinder
  include Neighbor

  def initialize(board, move)
    @board, @move = board, move
  end

  def find!
    @empties    = []
    @cells      = @board.cells.void.where(played: false)
    played_cell = @board.cells.find_by @move
    neighbors(played_cell).each { |n| n.update(played: true) }
  end

  private

  def neighbors(cell)
    if cell&.not_mines_neighbors?
      @cells.each do |empty_cell|
        set_and_find empty_cell if not_included_and_neighbor cell, empty_cell
      end
    end
    @empties
  end

  def set_and_find(empty_cell)
    @empties << empty_cell
    neighbors empty_cell
  end

  def not_included_and_neighbor(cell, empty_cell)
    neighbor?(cell, empty_cell) && !@empties.include?(empty_cell)
  end
end