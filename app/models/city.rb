class City < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessor :slug

  # searchkick
  has_many :users
  has_many :city_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos
  serialize :geo_shape, Hash

  geocoded_by :address

  def max_age_population_rate
    [population_0_to_25_years_rate, population_25_to_64_years_rate, population_65_years_and_more_rate].max
  end

  def max_age_population_range
    case max_age_population_rate
    when population_0_to_25_years_rate then "Moins de 25 ans"
    when population_25_to_64_years_rate then "Entre 25 et 64 ans"
    when population_65_years_and_more_rate then "Plus de 64 ans"
    end
  end

  def max_type_of_homes_rate
    [flats_rate, houses_rate].max
  end

  def max_type_of_homes_category
    case max_type_of_homes_rate
    when flats_rate then "Appartements"
    when houses_rate then "Maisons"
    end
  end

  def tourism_range
    if tourism_structures_number < 60
      "Peu touristique"
    elsif tourism_structures_number < 2_000
      "Touristique"
    elsif tourism_structures_number < 90_000
      "Très touristique"
    else
      ""
    end
  end
end
