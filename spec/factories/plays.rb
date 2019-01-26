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

FactoryBot.define do
  factory :play do
    x_coordinate { 1 }
    y_coordinate { 1 }
    game { nil }
  end
end
