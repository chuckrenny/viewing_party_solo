class Movie
  attr_reader :id,
              :title,
              :runtime,
              :vote_average,
              :genres,
              :overview,
              :img

  def initialize(attributes)
    @id           = attributes[:id]
    @title        = attributes[:title]
    @runtime      = attributes[:runtime]
    @vote_average = attributes[:vote_average]
    @genres       = attributes[:genres]
    @overview     = attributes[:overview]
    @img          = attributes[:poster_path]
  end

  def find_genres
    @genres.map { |genre| genre[:name] }.join(', ')
  end

  def format_runtime
    hours = @runtime / 60
    minutes = @runtime % 60
    "#{hours}hr #{minutes}min"
  end
end
