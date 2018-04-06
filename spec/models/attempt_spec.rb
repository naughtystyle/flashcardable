require "rails_helper"

RSpec.describe Attempt do
  it { should belong_to(:card) }

  it { should validate_presence_of(:card) }

  describe "#correct?" do
    context "when it's correct" do
      it "returns true" do
        attempt = build_stubbed(:attempt, correct: true)

        expect(attempt.correct?).to be_truthy
      end
    end

    context "when it's incorrect" do
      it "returns false" do
        attempt = build_stubbed(:attempt, correct: false)

        expect(attempt.correct?).to be_falsy
      end
    end
  end
end
