class Deck < ApplicationRecord
  validates :title, presence: true

  def self.published
    where(published: true)
  end
end
