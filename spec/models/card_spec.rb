require "rails_helper"

RSpec.describe Card do
  context "#question" do
    it "returns card's question" do
      card = Card.new("Question", "Answer")

      question = card.question

      expect(question).to eq("Question")
    end
  end

  context "#answer" do
    it "returns card's answer" do
      card = Card.new("Question", "Answer")

      answer = card.answer

      expect(answer).to eq("Answer")
    end
  end

  context "#position" do
    it "returns position of the card" do
      card = Card.new("Question", "Answer")

      card.position = 1

      expect(card.position).to eq(1)
    end
  end

  context "#title" do
    it "returns the title of the card" do
      card = Card.new("Question", "Answer")

      card.title = "Title"

      expect(card.title).to eq("Title")
    end
  end
end
