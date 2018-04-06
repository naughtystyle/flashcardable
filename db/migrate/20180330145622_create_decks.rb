class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks, id: :uuid do |t|
      t.string :title, null: false
      t.boolean :published, null: false, default: false

      t.timestamps null: false
    end
  end
end
