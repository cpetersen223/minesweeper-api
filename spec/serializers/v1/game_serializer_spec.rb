require "rails_helper"

RSpec.describe V1::GameSerializer, type: :serializer do
  let(:category) { create(:game) }
  let(:serializer) { described_class.new(category) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  let(:subject) { JSON.parse(serialization.to_json) }

  it "includes the expected game attributes" do
    expect(subject.keys).to contain_exactly("id", "player", "won", "over", "board", "plays")
  end

  it "includes the expected board attributes" do
    expect(subject["board"].keys).to contain_exactly("rows", "cols", "mines_percentage")
  end
end