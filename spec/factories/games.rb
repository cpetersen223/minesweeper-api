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

FactoryBot.define do
  factory :game do
    player { "MyString" }
    over { false }
    won { false }
  end
end
