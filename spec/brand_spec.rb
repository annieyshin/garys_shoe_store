require 'spec_helper'

describe(Brand) do
  it { should have_many(:stores)}

  it { should validate_uniqueness_of(:shoe_name)}
end
