require 'spec_helper'

describe(Store) do

  it { should have_many(:brands)}

  it("validates presence of store name") do
  store = Store.new({:name => ""})
  expect(store.save()).to(eq(false))
  end

  it("ensures the length of store name is at most 100 characters") do
    store = Store.new({:name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end

  it("converts the store name to capitalize") do
    store = Store.create({:name => "shoe wiZards of the coast"})
    expect(store.name()).to(eq("Shoe wizards of the coast"))
  end

  it { should validate_uniqueness_of(:name)}

end
