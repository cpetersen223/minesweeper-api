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
  has_many :mines, dependent: :destroy
  belongs_to :game

  validates_presence_of :rows, :cols, :mines_percentage
end
