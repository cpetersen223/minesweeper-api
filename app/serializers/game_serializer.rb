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

class GameSerializer < ActiveModel::Serializer
  attributes :id, :player, :won, :over
  has_one :board
  has_many :plays
end
