class Brand < ActiveRecord::Base
  has_many :brand_stores
  has_many :stores, through: :brand_stores
  validates(:shoe_name, :presence => true)
  validates :shoe_name, uniqueness: true
  validates(:shoe_name, {:presence => true, :length => { :maximum => 100 }})
  before_save(:capitalize_shoe_name)

  private

    def capitalize_shoe_name
      self.shoe_name=(shoe_name().capitalize())
    end
  end
