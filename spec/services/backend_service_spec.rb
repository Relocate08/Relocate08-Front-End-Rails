require 'rails_helper'

describe "BackendService" do
  describe 'class methods' do
    describe 'Locations' do
      it 'Location should exist' do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        json_response = File.read('spec/fixtures/location_search.json')

        stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

         search = BackendService.location_exists(user.id)
        
         expect(search).to be_a(Hash)
         expect(search[:data][:attributes][:location]).to eq("80110")
      end

      it "location should not exist" do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        json_response = File.read('spec/fixtures/location_search_null.json')

        stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/#{user.id}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

         search = BackendService.location_exists(user.id)

         expect(search).to be_a(Hash)
         expect(search[:data]).to eq(nil)
      end
    end
  end
end
