class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.text :description, null: false
      t.integer :population, null: false

      t.timestamps
    end
  end
end
