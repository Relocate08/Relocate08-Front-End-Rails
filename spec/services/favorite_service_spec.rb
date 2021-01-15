require 'rails_helper'

describe FavoritesService do
  context 'class methods' do
    it '.conn' do
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v1.3.0'
          }
        )
        .to_return(status: 200, body: '', headers: {})
    end

    it '.show_favorite' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)

      first_login = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: first_login, headers: {})

      have_favs = File.read('spec/fixtures/get_favorite.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: have_favs, headers: {})


      fav = File.read('spec/fixtures/xcel_fav.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/businesses/9s8dfs7fsdmsdf')
      .to_return(status: 200, body: fav, headers: {})

      info = FavoritesService.show_favorite('9s8dfs7fsdmsdf')
      
      expect(info).to be_a Hash
      expect(info[:data]).to have_key(:id)
      expect(info[:data][:id]).to be_a String

      expect(info[:data]).to have_key(:type)
      expect(info[:data][:type]).to be_a String

      expect(info[:data]).to have_key(:attributes)
      expect(info[:data][:attributes]).to be_a Hash

      info_attr = info[:data][:attributes]
      expect(info_attr).to have_key(:name)
      expect(info_attr[:name]).to be_a String
      expect(info_attr).to have_key(:image)
      expect(info_attr[:image]).to be_a String
      expect(info_attr).to have_key(:url)
      expect(info_attr[:url]).to be_a String
      expect(info_attr).to have_key(:phone)
      expect(info_attr[:phone]).to be_a String
      expect(info_attr).to have_key(:distance)
      expect(info_attr[:distance]).to eq(nil)
      expect(info_attr).to have_key(:location)
      expect(info_attr[:location]).to be_a String
      expect(info_attr).to have_key(:id)
      expect(info_attr[:id]).to be_a String
    end

    it '.delete_favorite' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)

      first_login = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: first_login, headers: {})

      have_favs = File.read('spec/fixtures/get_favorite.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: have_favs, headers: {})


      fav = File.read('spec/fixtures/xcel_fav.json')
      stub_request(:delete, "https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/9s8dfs7fsdmsdf/1").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: fav, headers: {})


      info = FavoritesService.delete_favorite('9s8dfs7fsdmsdf', @user.id)
      expect(info.status).to eq(200)
    end
  end
end
