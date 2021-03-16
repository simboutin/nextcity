class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :job_title
      t.string :city_type
      t.string :city_size
      t.string :environment
      t.string :home_type
      t.string :home_category
      t.integer :home_size
      t.integer :home_budget
      t.string :cities_result
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
