class Movie < ApplicationRecord
   validates :title, presence: true
   validates :image, presence: true
   
   mount_uploader :image, ImageUploader
   
   has_many :reviews
end
