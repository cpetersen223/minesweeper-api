class PlayVerifier
  def initialize(game:, move:)
    @game, @move = game, move
  end

  def move
    play && cell_played!
  end

  def playable?
    !cell.played?
  end

  def cell?
    cell.present?
  end

  def won?
    @game.board.cells.where(played: false, kind: :empty).blank?
  end

  def over?
    won? || cell.mine?
  end

  def play
    @play ||= @game.plays.find_or_create_by! @move
  end

  private

  def cell
    @cell ||= @game.board.cells.find_by @move
  end

  def cell_played!
    cell.toggle :played and cell.save
  end
end
