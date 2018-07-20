require 'spec_helper'

describe(BrandStore) do
  it { should belong_to(:brand)}
  it { should belong_to(:store)}
  it "deletes a store and its associated brands" do
    store = Store.create({:name => "JC Penny"})
    brand = Brand.create({:shoe_name => 'Lollys'})
    store.brand_stores.create({:brand => brand})
    store2 = Store.create({:name => "Sears"})
    brand2 = Brand.create({:shoe_name => 'Sketchys'})
    store2.brand_stores.create({:brand => brand2})
    brand_stores = StoreBrand.where(store_id: store.id).destroy_all
    store.destroy
    expect(StoreBrand.all).to(eq(store2.brand_stores))
    expect(Store.all).to(eq([store2]))
  end
end
