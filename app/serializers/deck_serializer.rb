class DeckSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :published

  has_many :cards
end
