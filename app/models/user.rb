class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarks, dependent: :destroy
  has_many :city_comments, dependent: :destroy
  has_many :searches, dependent: :destroy
  has_one_attached :photo
  belongs_to :city, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :address, presence: true

  def bookmark_for(city)
    bookmarks.find_by(city: city)
  end

  def ask_question?(city)
    !ambassador || (ambassador && self.city != city)
  end
end
