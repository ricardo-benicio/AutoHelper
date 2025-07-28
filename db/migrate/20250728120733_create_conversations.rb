class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.integer :urgency_level

      t.timestamps
    end
  end
end
