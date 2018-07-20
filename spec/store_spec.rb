require 'spec_helper'

describe(Store) do
  it { should have_many(:brands)}

  it { should validate_uniqueness_of(:name)}
end
