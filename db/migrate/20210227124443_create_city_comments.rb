class CreateCityComments < ActiveRecord::Migration[6.1]
  def change
    create_table :city_comments do |t|
      t.text :content
      t.references :city, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
