class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :ski_resort
  has_many :post_comments,  dependent: :destroy
  has_many :favorites,      dependent: :destroy

  has_many_attached :images

  validates :body, presence:true, length: { maximum: 200 }
  
   scope :latest, -> {order(created_at: :desc)}
   scope :old, -> {order(created_at: :asc)}
   scope :star_count, -> {order(star: :desc)}
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
