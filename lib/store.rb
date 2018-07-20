class Store < ActiveRecord::Base
  has_many :brand_stores
  has_many :brands, through: :brand_stores

  validates :name, uniqueness: true
end
