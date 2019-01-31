class EmptyCellFinder
  def initialize(board, move)
    @board, @move = board, move
  end

  def find!
    @cells = @board.cells.void.where(played: false, mines_neighbors: 0)
    played_cell = @board.cells.find_by @move
    if played_cell&.mines_neighbors == 0
      @empties = []
      neighbors(played_cell).each { |n| n.update(played: true) }
    end
  end

  private

  def neighbors(cell)
    @cells.each do |empty_cell|
      set_and_find empty_cell if not_included_and_neighbor cell, empty_cell
    end
    @empties
  end

  def set_and_find(empty_cell)
    @empties << empty_cell
    neighbors empty_cell
  end

  def not_included_and_neighbor(cell, empty_cell)
    neighbor(cell, empty_cell) && !@empties.include?(empty_cell)
  end

  def neighbor(pos1, pos2)
    is_between(pos1[:x], pos2[:x]) && is_between(pos1[:y], pos2[:y])
  end

  def is_between(cell_position, mine_position)
    cell_position + 1 == mine_position ||
        cell_position - 1 == mine_position ||
        cell_position == mine_position
  end
end