require "rails_helper"

RSpec.describe "V1::Games API", type: :request do
  let!(:games) { create_list(:game, 10) }
  let(:game) { games.first }
  let(:game_id) { game.id }

  describe "GET /api/v1/games" do
    before { get "/api/v1/games" }

    it "returns all games" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/games/:id" do
    before { get "/api/v1/games/#{game_id}" }

    context "when the record exists" do
      it "returns the specific game" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(game_id)
        expect(json["board"]).to be_present
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:game_id) { games.last.id + 1 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Game with 'id'=#{game_id}/)
      end
    end
  end

  describe "POST /api/v1/games" do
    let(:player) { "John Doe" }
    let(:board) { { rows: 5, cols: 5, mines_percentage: 5 } }
    let(:valid_attributes) { { player: player, board: board } }

    context "when the request is valid" do
      before { post "/api/v1/games", params: valid_attributes }

      it "creates a game" do
        expect(json["player"]).to eq(player)
        expect(json["board"]["rows"]).to eq(board[:rows])
        expect(json["board"]["cols"]).to eq(board[:cols])
        expect(json["board"]["mines_percentage"]).to eq(board[:mines_percentage])
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is valid and not passing values" do
      before { post "/api/v1/games", params: {} }

      it "creates a game" do
        expect(json["player"]).to be_nil
        expect(json["board"]["rows"]).to eq(10)
        expect(json["board"]["cols"]).to eq(10)
        expect(json["board"]["mines_percentage"]).to eq(10)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "PUT /api/v1/games/:id" do
    let(:valid_attributes) { { player: "John Doe" } }

    context "when the record exists" do
      before { put "/api/v1/games/#{game.id}", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /api/v1/games/:id" do
    before { delete "/api/v1/games/#{game.id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
