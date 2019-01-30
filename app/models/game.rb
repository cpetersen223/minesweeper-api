# == Schema Information
#
# Table name: games
#
#  id         :bigint(8)        not null, primary key
#  player     :string(255)
#  over       :boolean          default(FALSE)
#  won        :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  has_many :plays, dependent: :destroy
  has_one :board, dependent: :destroy

  validates_presence_of :board
  validates :over, :won, inclusion: { in: [false] }, on: :create

  after_initialize :set_defaults, on: :create

  accepts_nested_attributes_for :board

  def play!(move)
    @verifier = PlayVerifier.new game: self, move: move
    if plays.present?
      @verifier.move if @verifier.cell? && @verifier.playable?
      update won: @verifier.won?, over: @verifier.over?
    else
      @cell_factory = CellFactory.new(board: board, move: move).make
      @verifier.move
    end
    @verifier.play
  end

  private

  def set_defaults
    if new_record?
      self.over = false
      self.won  = false
      build_board unless board
    end
  end
end
