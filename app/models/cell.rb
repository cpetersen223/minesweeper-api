# == Schema Information
#
# Table name: cells
#
#  id              :bigint(8)        not null, primary key
#  x               :integer
#  y               :integer
#  board_id        :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  kind            :integer
#  played          :boolean          default(FALSE)
#  mines_neighbors :integer
#

class Cell < ApplicationRecord
  belongs_to :board
  enum kind: { void: 0, mine: 1 }

  validates_presence_of :x, :y, :kind

  def mines_neighbors?
    mines_neighbors > 0
  end

  def not_mines_neighbors?
    !mines_neighbors?
  end
end
