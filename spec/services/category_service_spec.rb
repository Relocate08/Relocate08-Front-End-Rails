require 'rails_helper'

describe CategoryService do
  describe 'class methods' do
    describe 'all businesses' do
      it 'returns all the businesses' do
        json_response = File.read('spec/fixtures/utilities/electric_search.json')
        stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/82011/utilities/electricity").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

        search = CategoryService.all_businesses('82011', 'utilities', 'electricity')

        expect(search).to be_a Hash
        expect(search[:data]).to be_an Array

        business_data = search[:data].first

        expect(business_data[:attributes]).to have_key :name
        expect(business_data[:attributes][:name]).to be_a(String)

        expect(business_data[:attributes]).to have_key :image
        expect(business_data[:attributes][:image]).to be_a(String)

        expect(business_data[:attributes]).to have_key :url
        expect(business_data[:attributes][:url]).to be_a(String)

        expect(business_data[:attributes]).to have_key :location
        expect(business_data[:attributes][:location]).to be_a(String)

        expect(business_data[:attributes]).to have_key :phone
        expect(business_data[:attributes][:phone]).to be_a(String)

        expect(business_data[:attributes]).to have_key :distance
        expect(business_data[:attributes][:distance]).to be_a(Float)
      end
    end
  end
end
