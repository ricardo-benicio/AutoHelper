class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
