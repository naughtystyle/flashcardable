class Deck < ApplicationRecord
  has_many :cards, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true

  def self.published
    where(published: true)
  end
end
