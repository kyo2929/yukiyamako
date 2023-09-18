class SkiResort < ApplicationRecord
  belongs_to :prefecture
  has_many :posts

  has_many_attached :ski_resort_images

  validates :name,          presence: true, length: { minimum: 2, maximum: 200 }, uniqueness: true
  validates :introduction,  presence: true, length: { maximum: 100 }
  validates :address,       presence: true
  validates :prefecture_id, presence: true
end
