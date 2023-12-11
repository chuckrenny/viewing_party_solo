class MoviesController < ApplicationController
  def index
    # the user that it belongs to since route is /user/:id/movies
    @user = User.find(params[:user_id])

    # pass in our search param
    search_query = params[:search]

    # if theres a search param then use search method, else return top 20 rated
    movies = search_query.present? ? MovieService.new.search_movies(search_query) : MovieService.new.top_rated_movies

    @movies = movies[:results]
  end

  def show

  end
end