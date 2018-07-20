require 'spec_helper'

  describe(Brand) do
    it("validates presence of shoe name") do
    brand = Brand.new({:shoe_name => ""})
    expect(brand.save()).to(eq(false))
    end
    it { should have_many(:stores)}

    it { should validate_uniqueness_of(:shoe_name)}

  end
