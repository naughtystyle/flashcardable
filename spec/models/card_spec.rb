require "rails_helper"

RSpec.describe Card do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }

  it { should belong_to(:deck) }

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
end
