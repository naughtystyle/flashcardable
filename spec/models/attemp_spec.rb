require "rails_helper"

RSpec.describe Attemp do
  context "#card" do
    it "returns card attempted" do
      card = Card.new("Q", "A")
      attemp = Attemp.new(card)

      expect(attemp.card).to eq(card)
    end
  end

  context "#correct?" do
    it "returns true when it is correct" do
      card = Card.new("Q", "A")
      attemp = Attemp.new(card)

      attemp.correct = true

      expect(attemp.correct?).to be_truthy
    end
  end
end
