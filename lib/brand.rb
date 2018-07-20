class Brand < ActiveRecord::Base
  has_many :brand_stores
  has_many :stores, through: :brand_stores
  validates(:shoe_name, :presence => true)
  validates :shoe_name, uniqueness: true
  validates(:shoe_name, {:presence => true, :length => { :maximum => 100 }})
  before_save(:capitalize_shoe_name)
  before_save(:number_to_currency_price)

  private

    def capitalize_shoe_name
      self.shoe_name=(shoe_name().capitalize())
    end

    def number_to_currency_price
      self.price=(price().number_to_currency(price, :unit => "$"))
    end

  end
