require 'net/http'
require 'json'


class Movie
    attr_accessor :token, :api_url
    def initialize
        @token = 'k_irk4ymps'
        @api_url = 'https://imdb-api.com/en/API/SearchMovie/k_irk4ymps/'
    end

    def searchMovie(movieName='')
        url = api_url + movieName;
        uri = URI(url)
        response = Net::HTTP.get(uri)
        puts response
        response = JSON.parse(response)
        response
        
    end
    def TopMovies()
        url = 'https://imdb-api.com/en/API/MostPopularMovies/k_irk4ymps';
        uri = URI(url)
        response = Net::HTTP.get(uri)
        puts response
        response = JSON.parse(response)
        response
        
    end
end