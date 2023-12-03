require "rails_helper"

RSpec.describe MovieService do
  before :each do
    @service = MovieService.new
  end

  context "class methods" do
    context "#get_url", :vcr do
      it "returns parsed json data" do
        @service = MovieService.new
        results = @service.get_url('3/movie/238?language=en-US')

        expect(results).to be_a Hash
        expect(results[:genres]).to be_an Array
        expect(results[:id]).to be_an Integer
        expect(results[:original_title]).to be_a String
        expect(results[:overview]).to be_a String
        expect(results[:poster_path]).to be_a String
        expect(results[:vote_average]).to be_a Float
      end
    end

    context "#conn", :vcr do
      it "returns Faraday object" do
        expect(@service.conn).to be_a(Faraday::Connection)
      end
    end
  end
end