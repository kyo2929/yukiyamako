class SkiResort < ApplicationRecord

  belongs_to :prefecture
  has_many :posts

  has_many_attached :image

end
