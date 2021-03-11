class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :city_comment
end
