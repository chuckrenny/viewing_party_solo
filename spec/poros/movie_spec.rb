require 'rails_helper'

RSpec.describe Movie do
  before :each do
    attrs = {
      id: 238,
      title: "The Godfather",
      runtime: 178,
      vote_average: 8.7,
      genres: [{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}],
      overview: "Mafia Stuff",
    }

    @movie = Movie.new(attrs)
  end

  it "exists" do
    expect(@movie).to be_a Movie
    expect(@movie.id).to eq(238)
    expect(@movie.title).to eq("The Godfather")
    expect(@movie.runtime).to eq(178)
    expect(@movie.vote_average).to eq(8.7)
    expect(@movie.genres).to eq([{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}])
    expect(@movie.overview).to eq("Mafia Stuff")
  end

  describe 'instance methods' do
    it '#find_genres' do
      expect(@movie.find_genres).to eq('Drama, Crime')
    end

    it "#format_runtime" do
      expect(@movie.format_runtime).to eq("2hr 58min")
    end
  end
end