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

require "rails_helper"

RSpec.describe Board, type: :model do
  # Association test
  it { should have_many(:mines).dependent(:destroy) }
  it { should belong_to(:game) }

  # Validation tests
  it { should validate_presence_of(:rows) }
  it { should validate_presence_of(:cols) }
  it { should validate_presence_of(:mines_percentage) }
end
