# == Schema Information
#
# Table name: plays
#
#  id         :bigint(8)        not null, primary key
#  x          :integer
#  y          :integer
#  game_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Play < ApplicationRecord
  belongs_to :game

  validates_presence_of :x, :y
end
