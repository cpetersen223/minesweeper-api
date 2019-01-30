require 'rails_helper'

RSpec.describe 'V1::Plays', type: :request do
  let(:game) { create(:game) }
  let!(:plays) { create_list(:play, 20, game: game, x: rand(game.board.cols), y: rand(game.board.rows)) }
  let(:play) { plays.first }
  let(:play_id) { play.id }

  describe 'GET /plays' do
    before { get "/api/v1/games/#{game.id}/plays" }

    context 'when plays exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all plays' do
        expect(json.size).to eq(20)
      end
    end
  end

  describe 'GET plays/:id' do
    before { get "/api/v1/plays/#{play_id}" }

    context 'when game play exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the play' do
        expect(json['x']).to eq(play.x)
      end
    end

    context 'when play does not exist' do
      let(:play_id) { plays.last.id + 1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Play/)
      end
    end
  end

  describe 'POST /games/:game_id/plays' do
    let!(:game) { create(:game) }
    let(:game_id) { game.id }
    let(:valid_attributes) { {x: 1, y: 0 } }

    context 'when request attributes are valid' do
      before { post "/api/v1/games/#{game_id}/plays", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    # context 'when an invalid request' do
    #   before { post "/api/v1/games/#{game_id}/plays", params: {} }
    #
    #   it 'returns status code 422' do
    #     expect(response).to have_http_status(422)
    #   end
    #
    #   it 'returns a failure message' do
    #     expect(response.body).to match(/Validation failed: X can't be blank/)
    #   end
    # end
  end

  describe 'PUT plays/:id' do
    context 'when play exists' do
      before do
        @x = 10
        @valid_attributes = { x: @x }
        put "/api/v1/plays/#{play_id}", params: @valid_attributes
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the play' do
        updated_play = Play.find play_id
        expect(updated_play.x).to match(@x)
      end
    end

    context 'when the play does not exist' do
      before do
        @x = 1
        @valid_attributes = { x: @x }
        put "/api/v1/plays/#{plays.last.id + 1}", params: @valid_attributes
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Play/)
      end
    end
  end

  describe 'DELETE /plays/:id' do
    before { delete "/api/v1/plays/#{play_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end