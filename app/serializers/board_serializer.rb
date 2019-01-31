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

class BoardSerializer < ActiveModel::Serializer
  attributes :rows, :cols, :mines_percentage
  has_many :cells
  belongs_to :game
end
