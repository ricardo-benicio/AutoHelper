class CreateWorkshops < ActiveRecord::Migration[7.1]
  def change
    create_table :workshops do |t|
      t.string :name
      t.text :address
      t.text :specialties
      t.string :phone
      t.decimal :rating
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
