class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :ski_resort
  has_many :post_comments, dependent: :destroy
  has_many :favorites,     dependent: :destroy

  has_many_attached :image

  validates :body, presence:true, length: { maximum: 200 }
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
