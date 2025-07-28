class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :conversation, null: false, foreign_key: true
      t.text :context
      t.string :sender_type
      t.boolean :ai_response

      t.timestamps
    end
  end
end
