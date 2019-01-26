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

FactoryBot.define do
  factory :board do
    rows { 1 }
    cols { 1 }
    mines_percentage { 1 }
    game { nil }
  end
end
