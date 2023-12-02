require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
  end

  describe "relationships" do
    it { should have_many(:users_viewing_parties)}
    it { should have_many(:viewing_parties).through(:users_viewing_parties)}
  end
end