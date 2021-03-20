class AddFieldsToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :job_ads, :integer
    add_column :cities, :home_ads, :integer
    add_column :cities, :rain_days, :float
    add_column :cities, :sun_hours, :integer
  end
end
