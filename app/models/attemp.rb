class Attemp
  attr_reader :card
  attr_accessor :correct

  def initialize(card)
    @card = card
  end

  alias_method :correct?, :correct
end
