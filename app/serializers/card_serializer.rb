class CardSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :question, :answer, :position

  belongs_to :deck
end
