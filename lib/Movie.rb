require 'net/http'
require 'json'

class Movie
  attr_accessor :token, :api_url

  def initialize(token)
    @token = token
    @api_url = 'https://imdb-api.com/en/API/SearchMovie/'
  end

  def search_movie(movie_mame = '')
    url = api_url + movie_mame
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def top_movies
    url = "https://imdb-api.com/en/API/MostPopularMovies/#{@token}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def rand_movie
    url = "https://imdb-api.com/en/API/MostPopularMovies/#{@token}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response['items'].to_a.sample(1)
  end

  def in_theaters
    url = "https://imdb-api.com/en/API/InTheaters/#{@token}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def soon
    url = "https://imdb-api.com/en/API/ComingSoon/#{@token}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
