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

FactoryBot.define do
  factory :mine do
    x_coordinate { 1 }
    y_coordinate { 1 }
    board { nil }
  end
end
