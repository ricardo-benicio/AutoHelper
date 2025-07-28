class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :workshop, null: false, foreign_key: true
      t.datetime :datetime
      t.string :status

      t.timestamps
    end
  end
end
