require "rails_helper"

RSpec.describe Deck do
  it { should have_many(:cards).dependent(:destroy) }

  it { should validate_presence_of(:title) }

  describe ".published" do
    it "returns the list of published decks" do
      published_deck = create(:deck, published: true)
      _unpublished_deck = create(:deck, published: false)

      expect(Deck.published).to eq([published_deck])
    end
  end

  describe "#cards" do
    it "returns the cards ordered by position" do
      deck = create(:deck)

      older_card = create(:card, deck: deck, position: 2)
      newer_card = create(:card, deck: deck, position: 1)

      expect(deck.cards).to match([newer_card, older_card])
    end
  end

  describe "#size" do
    it "returns the number of flashcards the deck has" do
      deck = create(:deck)
      create(:card, deck: deck)
      create(:card, deck: deck)

      expect(deck.size).to eq(2)
    end
  end
end
