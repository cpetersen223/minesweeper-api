# == Schema Information
#
# Table name: mines
#
#  id         :bigint(8)        not null, primary key
#  x          :integer
#  y          :integer
#  board_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cell < ApplicationRecord
  belongs_to :board
  enum kind: { empty: 0, mine: 1 }

  validates_presence_of :x, :y, :kind
end
