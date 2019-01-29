class PlayChecker
  def initialize(game:, move:)
    @game, @move = game, move
  end

  def playable?
    !cell.played?
  end

  def cell
    @cell ||= @game.board.cells.find_by @move
  end

  def win?
    @game.board.cells.where(played: false, kind: :empty).present?
  end

  def over?
    win? || @cell.mine?
  end

  def cell?
    cell.present?
  end
end