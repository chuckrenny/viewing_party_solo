require "rails_helper"

RSpec.describe ViewingParty, type: :model do
  describe "validations" do
    it { should validate_presence_of(:movie_id)}
    it { should validate_presence_of(:movie_title)}
    it { should validate_presence_of(:duration)}
    it { should validate_presence_of(:date)}
    it { should validate_presence_of(:start_time)}
  end

  describe "relationships" do
    it { should have_many(:users_viewing_parties)}
    it { should have_many(:users).through(:users_viewing_parties)}
  end
end