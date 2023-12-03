class MovieService
  def conn
    Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end 
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true) 
  end

  # def members_by_state(state)
  #   get_url("/congress/v1/members/house/#{state}/current.json") # specific endpoint
  # end
end