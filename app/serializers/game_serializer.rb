class GameSerializer < ActiveModel::Serializer
  attributes :id, :player, :won, :over
  has_one :board
  has_many :plays
end
