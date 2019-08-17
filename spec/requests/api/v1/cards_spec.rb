require "rails_helper"

RSpec.describe "GET /api/v1/decks/:deck_id/cards" do
  it "returns the cards for the specified deck" do
    deck = create(:deck)
    _, card = create_list(
      :card,
      2,
      deck: deck
    )

    get "/api/v1/decks/#{deck.id}/cards"

    expect(json_body["data"].count).to eq(2)

    card_json = json_body["data"].last
    expect(card_json).to eq({
      "id" =>  card.id,
      "type" => "card",
      "attributes" => {
        "title" => card.title,
        "question" => card.question,
        "answer" => card.answer,
        "position" => card.position,
      },
      "relationships" => {
        "deck" => {
          "data" => {
            "id" => deck.id,
            "type"=>"deck"
          }
        }
      }
    })
  end
end

RSpec.describe "GET /api/v1/decks/:deck_id/cards/:id" do
  it "returns a card" do
    card = create(:card)
    deck = card.deck

    get "/api/v1/decks/#{deck.id}/cards/#{card.id}"

    expect(response.status).to eq(200)

    card_json = json_body["data"]
    expect(card_json).to eq({
      "id" =>  card.id,
      "type" => "card",
      "attributes" => {
        "title" => card.title,
        "question" => card.question,
        "answer" => card.answer,
        "position" => card.position,
      },
      "relationships" => {
        "deck" => {
          "data" => {
            "id" => deck.id,
            "type"=>"deck"
          }
        }
      }
    })
  end

  context "when card is not found" do
    it "responds with a 404 Not Found status" do
      deck = create(:deck)
      nonexistent_id = 371

      get "/api/v1/decks/#{deck.id}/cards/#{nonexistent_id}"

      expect(response.status).to eq(404)
      expect(json_body.fetch("errors")).not_to be_empty
    end
  end
end

RSpec.describe "POST /api/v1/decks/:deck_id/cards" do
  it "creates the card with Created status" do
    deck = create(:deck)
    card_params = attributes_for(:card)

    post "/api/v1/decks/#{deck.id}/cards", params: { card: card_params }

    expect(response.status).to eq(201)
    expect(Card.last.title).to eq(card_params[:title])
  end

  context "when there are invalid attributes" do
    it "returns 422 Unprocessable Entity with errors" do
      deck = create(:deck)
      card_params = attributes_for(:card, :invalid)

      post "/api/v1/decks/#{deck.id}/cards", params: { card: card_params }

      expect(response.status).to eq(422)
      expect(json_body.fetch("errors")).not_to be_empty
    end
  end
end

RSpec.describe "PATCH /api/v1/decks/:deck_id/cards/:id" do
  it "updates the card with No Content header" do
    card = create(:card)
    deck = card.deck

    patch "/api/v1/decks/#{deck.id}/cards/#{card.id}", params: { card: { title: "New" } }

    expect(response.status).to eq(204)
    expect(card.reload.title).to eq("New")
  end

  context "when there are invalid attributes" do
    it "returns 422 Unprocessable Entity with errors" do
      card = create(:card)
      deck = card.deck

      patch "/api/v1/decks/#{deck.id}/cards/#{card.id}", params: { card: { title: nil } }

      expect(response.status).to eq(422)
      expect(json_body.fetch("errors")).not_to be_empty
    end
  end

  context "when parameters are missing" do
    it "returns 422 Unprocessable Entity with errors" do
      card = create(:card)
      deck = card.deck

      patch "/api/v1/decks/#{deck.id}/cards/#{card.id}", params: {}

      expect(response.status).to eq(422)
      expect(json_body.fetch("errors")).not_to be_empty
    end
  end
end

RSpec.describe "DELETE /api/v1/decks/:deck_id/cards/:id" do
  it "deletes the card with No Content header" do
    card = create(:card)
    deck = card.deck

    expect do
      delete "/api/v1/decks/#{deck.id}/cards/#{card.id}"
    end.to change(Card, :count).by(-1)

    expect(response.status).to eq(204)
  end
end
