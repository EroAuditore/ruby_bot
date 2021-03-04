require './lib/movie'

describe Movie do
  let(:movie) { Movie.new('k_28o0a0zk') }

  describe '#initialize' do
    it 'initialize movie with token' do
      expect(movie.token).not_to eq ''
    end
  end

  describe '#soon' do
    it 'Should not respont with Inavalid api key' do
      json_response = movie.soon
      expect(json_response['errorMessage']).not_to eq('Invalid API Key')
    end
  end

  describe '#top_movies' do
    it 'Should not respont with Inavalid api key' do
      json_response = movie.top_movies
      expect(json_response['errorMessage']).not_to eq('Invalid API Key')
    end
  end

  describe '#rand_movie' do
    it 'returns a title with rand movie' do
      sample = movie.rand_movie
      expect(sample[0]['title']).not_to eq('')
    end
  end

  describe '#in_theaters' do
    it 'Should not respont with Inavalid api key' do
      json_response = movie.in_theaters
      expect(json_response['errorMessage']).not_to eq('Invalid API Key')
    end
  end
end
