class Brand < ActiveRecord::Base
  has_many :brand_stores
  has_many :stores, through: :brand_stores

  validates :name, uniqueness: true
end
