class Search < ApplicationRecord
  belongs_to :user
  validates :job_title, presence: true
  serialize :cities_result, Array

  # HOME_CATEGORIES = ['Studio', 'T1', 'T2', 'T3', 'T4']
end
