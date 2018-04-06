class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts, id: :uuid do |t|
      t.boolean :correct, null: false, default: false
      t.references :card, type: :uuid, null: false, index: true

      t.timestamps null: false
    end
    add_foreign_key :attempts, :cards, on_delete: :cascade
  end
end
