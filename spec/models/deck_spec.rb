require "rails_helper"

RSpec.describe Deck do
  context "#title" do
    it "gets the title of the deck" do
      deck = Deck.new("Title")

      expect(deck.title).to eq("Title")
    end
  end

  context "#cards" do
    it "returns an empty list when no cards were added" do
      deck = Deck.new

      expect(deck.cards).to eq([])
    end

    it "returns a list of cards" do
      deck = Deck.new
      card = Card.new("Q", "A")

      deck.cards << card

      expect(deck.cards).to eq([card])
    end
  end

  context "#cards_count" do
    it "returns zero when no cards were added" do
      deck = Deck.new

      expect(deck.cards_count).to eq(0)
    end

    it "returns the number of cards in the deck" do
      deck = Deck.new
      card_1 = Card.new("Q", "A")
      card_2 = Card.new("Q", "A")

      deck.cards << card_1
      deck.cards << card_2

      expect(deck.cards_count).to eq(2)
    end
  end
end
