class Deck
  attr_reader :title

  def initialize(title = "")
    @title = title
  end

  def cards
    @cards ||= []
  end

  def cards_count
    cards.size
  end
end
