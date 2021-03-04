require './lib/movie'

describe Movie do
    let(:movie) { Movie.new }

    describe '#initialize' do
        it 'initialize movie with token' do
            expect(movie.token).to eq 'k_irk4ymps'
        end
    end
      
    describe '#soon' do
        it 'respond with has' do
            json_response = movie.soon
            puts json_response["errorMessage"]
            expect(json_response["errorMessage"]).to be_empty
        end
    end
    

end