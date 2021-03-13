class AddColumnsToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :geo_shape, :text
    add_column :cities, :region_code, :integer
    add_column :cities, :region_name, :string
    add_column :cities, :department_code, :integer
    add_column :cities, :department_name, :string
    add_column :cities, :employment_zone_code, :integer
    add_column :cities, :employment_zone_name, :string
    add_column :cities, :epci_code, :integer
    add_column :cities, :epci_name, :string
    add_column :cities, :city_code, :string
    add_column :cities, :city_type, :string
    add_column :cities, :flats_rental_price, :float
    add_column :cities, :houses_rental_price, :float
    add_column :cities, :mountain, :string
    add_column :cities, :coastline, :boolean
    add_column :cities, :mayor_last_name, :string
    add_column :cities, :mayor_first_name, :string
    add_column :cities, :mayor_gender, :string
    add_column :cities, :mayor_date_of_birth, :date
    add_column :cities, :ftth_homes_rate, :float
    add_column :cities, :population_0_to_25_years_rate, :float
    add_column :cities, :population_25_to_64_years_rate, :float
    add_column :cities, :population_65_years_and_more_rate, :float
    add_column :cities, :principal_residences_rate, :float
    add_column :cities, :flats_rate, :float
    add_column :cities, :houses_rate, :float
    add_column :cities, :owners_rate, :float
    add_column :cities, :renters_rate, :float
    add_column :cities, :vacant_houses_rate, :float
    add_column :cities, :net_hourly_wage, :float
    add_column :cities, :unemployment_rate, :float
    add_column :cities, :tourism_structures_number, :integer
  end
end
