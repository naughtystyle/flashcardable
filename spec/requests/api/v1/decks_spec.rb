require "rails_helper"

RSpec.describe "GET /api/v1/decks" do
  it "returns a list of all the published decks" do
    deck = create(:deck, title: "Deck", published: true)
    create(:deck, published: true)
    create(:deck, published: false)

    get "/api/v1/decks"

    expect(json_body["data"].count).to eq(2)

    deck_json = json_body["data"].first
    expect(deck_json).to eq({
      "id" =>  deck.id,
      "type" => "deck",
      "attributes" => {
        "title" => deck.title,
        "published" => deck.published,
      },
      "relationships" => {
        "cards" => { "data" => [] }
      }
    })
  end
end

RSpec.describe "GET /api/v1/decks/:id" do
  it "returns a single deck" do
   deck = create(:deck, published: true)

   get "/api/v1/decks/#{deck.id}"

   deck_json = json_body["data"]
   expect(deck_json).to eq({
     "id" =>  deck.id,
     "type" => "deck",
     "attributes" => {
       "title" => deck.title,
       "published" => deck.published,
     },
     "relationships" => {
       "cards" => { "data" => [] }
     }
   })
  end

  context "when deck is not found and exception is raised" do
    it "responds with a 404 Not Found status" do
      nonexistent_id = 371

      get "/api/v1/decks/#{nonexistent_id}"

      expect(response.status).to eq(404)
      expect(json_body.fetch("errors")).not_to be_empty
    end
  end
end
