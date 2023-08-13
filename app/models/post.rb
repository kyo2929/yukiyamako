class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :ski_resort
  has_many :post_comments, dependent: :destroy
  has_many :favorite,     dependent: :destroy
  
  has_many_attached :image
  
  validates :budy, presence: true, length: { maximum: 200 }

end
