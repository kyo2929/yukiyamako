class SkiResort < ApplicationRecord

  belongs_to :prefecture
  has_many :posts

  has_many_attached :ski_resort_images

end
