class CardSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :question, :answer, :position
end
