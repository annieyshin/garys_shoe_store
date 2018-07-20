require 'spec_helper'

describe(Store) do
  it("validates presence of store name") do
  store = Store.new({:name => ""})
  expect(store.save()).to(eq(false))
  end

  it { should have_many(:brands)}

  it { should validate_uniqueness_of(:name)}

end
