require "rails_helper"

RSpec.describe Deck do
  it { should validate_presence_of(:title) }

  describe ".published" do
    it "returns the list of published decks" do
      published_deck = create(:deck, published: true)
      _unpublished_deck = create(:deck, published: false)

      expect(Deck.published).to eq([published_deck])
    end
  end
end
