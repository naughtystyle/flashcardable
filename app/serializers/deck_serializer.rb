class DeckSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :published
end
