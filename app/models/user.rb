class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  
  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 8, maximum:32 }
  
  has_many :reviews, dependent: :destroy
  has_many :favorites
  has_many :favorite_movies, through: :favorites, source: 'movie'
  has_many :checks
  has_many :check_movies, through: :checks, source: 'movie'
  has_many :wishes
  has_many :wish_movies, through: :wishes, source: 'movie'
  mount_uploader :image, ImageUploader
end
