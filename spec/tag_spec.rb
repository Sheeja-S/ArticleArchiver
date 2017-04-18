require "spec_helper"

describe Tag, type: :model do
  it { should have_many(:articles).through(:articles_tags) }
end
