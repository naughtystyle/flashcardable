require "rails_helper"

RSpec.describe Card do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }

  it { should belong_to(:deck) }
end
