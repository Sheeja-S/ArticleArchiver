require "spec_helper"

describe Article, type: :model do
  it { should have_many(:tags).through(:articles_tags) }
  it { should have_many(:users).through(:articles_users) }
end
