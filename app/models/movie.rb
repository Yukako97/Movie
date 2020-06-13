class Movie < ApplicationRecord
   validates :title, presence: true
   validates :image, presence: true
   
   mount_uploader :image, ImageUploader
   
   has_many :reviews, dependent: :destroy
   has_many :favorites
   has_many :checks
   has_many :wishes
end
