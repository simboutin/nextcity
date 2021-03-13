class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.float :latitude 
      t.float :longitude 
      t.text :description
      t.integer :population

      t.timestamps
    end
  end
end
