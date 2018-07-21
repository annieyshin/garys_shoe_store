require 'spec_helper'

describe(BrandStore) do
  it { should belong_to(:brand)}
  it { should belong_to(:store)}
  it "deletes a store and its associated brands" do
    store = Store.create({:name => "JC Penny"})
    brand = Brand.create({:shoe_name => 'Lollys', :price => "$1.00"})
    store.brands.push
    store.destroy
    expect(store.brands).to(eq([]))
  end
end
