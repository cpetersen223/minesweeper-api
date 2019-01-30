class PlaySerializer < ActiveModel::Serializer
  attributes :id, :x, :y
  belongs_to :game
end
