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

  after_initialize ->(game) { game.over = false; game.won = false }
end
