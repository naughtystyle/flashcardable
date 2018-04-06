class Card < ApplicationRecord
  belongs_to :deck, counter_cache: true
  has_many :attempts, -> { order(created_at: :desc) }

  validates :title, :question, :answer, presence: true

  acts_as_list scope: :deck

  def next
    lower_item
  end
end
