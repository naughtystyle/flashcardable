class Card
  attr_reader :question, :answer
  attr_accessor :position, :title

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end
