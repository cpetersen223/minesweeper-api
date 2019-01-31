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

class CellSerializer < ActiveModel::Serializer
  attributes :x, :y, :kind, :played
  belongs_to :board
end
