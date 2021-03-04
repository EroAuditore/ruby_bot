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
        response = JSON.parse(response)
        response
        
    end
    def topMovies
        url = 'https://imdb-api.com/en/API/MostPopularMovies/k_irk4ymps';
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        response
    end
    def randMovie
        url = 'https://imdb-api.com/en/API/MostPopularMovies/k_irk4ymps';
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        sample = response['items'].to_a.sample(1)
        sample
    end
    def inTheaters
        url = 'https://imdb-api.com/en/API/InTheaters/k_irk4ymps';
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        response
    end
end