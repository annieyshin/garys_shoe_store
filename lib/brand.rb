class Brand < ActiveRecord::Base
  has_many :brand_stores
  has_many :stores, through: :brand_stores
  validates(:shoe_name, :presence => true)
  validates :shoe_name, uniqueness: true

end
