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

require "rails_helper"

RSpec.describe Cell, type: :model do
  # Association test
  it { should belong_to(:board) }
  # Validation test
  it { should validate_presence_of(:x) }
  it { should validate_presence_of(:y) }
  it { should validate_presence_of(:kind) }
end
