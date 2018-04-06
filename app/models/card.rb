class Card < ApplicationRecord
  belongs_to :deck

  validates :title, :question, :answer, presence: true

  acts_as_list scope: :deck
end
