require "spec_helper"

describe User, type: :model do
  it { should have_many(:articles).through(:articles_users) }
end
