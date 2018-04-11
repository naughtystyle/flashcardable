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
     }
   })
  end

  context "when deck is not found and exception is raised" do
    it "responds with a 404 not found status" do
      nonexistent_id = 371

      get "/api/v1/decks/#{nonexistent_id}"

      expect(response).to be_a_not_found
    end
  end
end
