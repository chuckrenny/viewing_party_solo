class MovieFacade
  def initialize(endpoint)
    @endpoint = endpoint
  end

  
  private

  def results
    MovieService.new.get_url(@endpoint)
  end
end