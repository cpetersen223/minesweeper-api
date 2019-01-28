# == Schema Information
#
# Table name: cells
#
#  id         :bigint(8)        not null, primary key
#  x          :integer
#  y          :integer
#  board_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kind       :integer
#

FactoryBot.define do
  factory :cell do
    x_coordinate { nil }
    y_coordinate { nil }
    kind { nil }
    board { nil }
  end
end
