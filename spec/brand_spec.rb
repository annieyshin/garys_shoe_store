require 'spec_helper'

  describe(Brand) do

    it { should have_many(:stores) }


    it("validates presence of shoe name") do
    brand = Brand.new({:shoe_name => ""})
    expect(brand.save()).to(eq(false))
    end

    it("ensures the length of brand shoe name is at most 100 characters") do
      brand = Brand.new({:shoe_name => "a".*(101)})
      expect(brand.save()).to(eq(false))
    end

    it("converts the brand shoe name to capitalize") do
      brand = Brand.create({:shoe_name => "shoe wiZard"})
      expect(brand.shoe_name()).to(eq("Shoe wizard"))
    end

    it { should validate_uniqueness_of(:shoe_name)}

  end
