require 'spec_helper'

  describe(Brand) do
    it("validates presence of shoe name") do
    brand = Brand.new({:shoe_name => ""})
    expect(brand.save()).to(eq(false))
    end

    it("ensures the length of brand shoe name is at most 100 characters") do
      brand = Brand.new({:shoe_name => "a".*(101)})
      expect(brand.save()).to(eq(false))
    end
    it { should have_many(:stores)}

    it { should validate_uniqueness_of(:shoe_name)}

  end
