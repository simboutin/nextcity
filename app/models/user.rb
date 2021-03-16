class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarks
  has_many :city_comments
  has_many :searches
  has_one_attached :photo
  has_many :city_comments, dependent: :destroy
  belongs_to :city, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :address, presence: true

  def bookmark_for(city)
    bookmarks.find_by(city: city)
  end
end
