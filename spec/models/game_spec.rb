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

require "rails_helper"

RSpec.describe Game, type: :model do
  # Association test
  describe "associations" do
    it { should have_one(:board).dependent(:destroy) }
    it { should have_many(:plays).dependent(:destroy) }
  end

  # Validation tests
  describe "validations" do
    it { should validate_presence_of(:board) }
    it { should validate_inclusion_of(:over).in_array([false]) }
    it { should validate_inclusion_of(:won).in_array([false]) }
  end
end
