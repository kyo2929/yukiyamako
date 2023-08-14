class Prefecture < ApplicationRecord
  has_many :ski_resorts, dependent: :destroy

  validates :name, presence: true
end
