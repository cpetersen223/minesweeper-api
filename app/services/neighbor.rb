module Neighbor
  def neighbor?(pos1, pos2)
    is_between?(pos1[:x], pos2[:x]) && is_between?(pos1[:y], pos2[:y])
  end

  def is_between?(cell_position, mine_position)
    cell_position + 1 == mine_position ||
        cell_position - 1 == mine_position ||
        cell_position == mine_position
  end
end