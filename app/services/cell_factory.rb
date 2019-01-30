class CellFactory
  def initialize(board:, move:)
    @board, @move = board, move
  end

  def make
    @board.cols.times do |x|
      @board.rows.times do |y|
        mine = mines.include?({ x: x, y: y })
        attrs = mine ? { x: x, y: y, kind: :mine } : { x: x, y: y, kind: :empty }
        attrs[:mines_neighbors] = calculate_neighbors attrs
        @board.cells << Cell.new(attrs)
      end
    end
  end

  private

  def mines
    @mines ||= calculate_mines
  end

  def calculate_mines
    mines_arr, repeated = [], true
    mines_number.times do
      mine = { x: rand(@board.cols), y: rand(@board.rows) }
      while repeated
        repeated = mines_arr.include?(mine) || first_move_mine?(mine)
      end
      mines_arr << mine
    end
    mines_arr
  end

  def first_move_mine?(mine)
    @move == mine
  end

  def calculate_neighbors(cell)
    return 0 if cell[:mine]
    mines.select { |mine| is_between(cell[:x], mine[:x]) && is_between(cell[:y], mine[:y]) }.length
  end

  private

  def mines_number
    @mines_number ||= cells_number * @board.mines_percentage / 100
  end

  def cells_number
    @cells_number ||= @board.rows * @board.cols
  end

  def is_between(cell_position, mine_position)
    cell_position + 1 == mine_position ||
        cell_position - 1 == mine_position ||
        cell_position == mine_position
  end
end
