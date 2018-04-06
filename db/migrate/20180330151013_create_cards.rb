class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.text :question, null: false
      t.text :answer, null: false
      t.integer :position, null: false
      t.string :title, null: false, default: ""
      t.references :deck, type: :uuid, null: false, index: true

      t.timestamps null: false
    end
    add_foreign_key :cards, :decks, on_delete: :cascade
  end
end
