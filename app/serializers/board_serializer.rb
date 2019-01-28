class BoardSerializer < ActiveModel::Serializer
  attributes :rows, :cols, :mines_percentage
  has_many :cells
end
