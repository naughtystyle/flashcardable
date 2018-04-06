class AddCardsCountToDeck < ActiveRecord::Migration[5.1]
  def change
    add_column :decks, :cards_count, :integer, default: 0
  end
end
