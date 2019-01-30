# == Schema Information
#
# Table name: boards
#
#  id               :bigint(8)        not null, primary key
#  rows             :integer
#  cols             :integer
#  mines_percentage :integer
#  game_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Board < ApplicationRecord
  DEFAULT_COLS = 10.freeze
  DEFAULT_ROWS = 10.freeze
  DEFAULT_MINES_PERCENTAGE = 10.freeze

  has_many :cells, dependent: :destroy
  belongs_to :game

  validates_presence_of :rows, :cols, :mines_percentage

  after_initialize :set_defaults

  private

  def set_defaults
    if new_record?
      self.cols ||= DEFAULT_COLS
      self.rows ||= DEFAULT_ROWS
      self.mines_percentage ||= DEFAULT_MINES_PERCENTAGE
    end
  end
end
