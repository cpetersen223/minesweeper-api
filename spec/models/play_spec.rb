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

require 'rails_helper'

RSpec.describe Play, type: :model do
  # Association test
  it { should belong_to(:game) }
  # Validation test
  it { should validate_presence_of(:x) }
  it { should validate_presence_of(:y) }
end
