class SkiResort < ApplicationRecord

  belongs_to :prefecture
  
  has_many :post

  has_many_attached :image

end
