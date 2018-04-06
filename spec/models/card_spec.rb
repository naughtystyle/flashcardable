require "rails_helper"

RSpec.describe Card do
  it { should belong_to(:deck) }
  it { should have_many(:attempts) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }

  describe "#next" do
    context "when there are more cards" do
      it "returns next card" do
        deck = create(:deck)

        first_card, second_card = create_list(
          :card,
          2,
          deck: deck
        )

        expect(first_card.next).to eq(second_card)
      end
    end

    context "when there are no more cards" do
      it "returns nil" do
        card = create(:card)

        expect(card.next).to be_nil
      end
    end
  end

  describe "#attempts" do
    it "orders by created_at most recent first" do
      card = create(:card)
      older_attempt = create(:attempt, card: card)
      newer_attempt = create(:attempt, card: card)

      expect(card.attempts).to eq([newer_attempt, older_attempt])
    end
  end
end
