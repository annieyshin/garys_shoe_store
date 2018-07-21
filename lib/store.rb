class Store < ActiveRecord::Base
  has_many :brand_stores
  has_many :brands, through: :brand_stores
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  validates(:name, uniqueness: true)
  validates(:name, :presence => true)
  before_save(:capitalize_name)

private

  def capitalize_name
    self.name=(name().capitalize())
  end
end
