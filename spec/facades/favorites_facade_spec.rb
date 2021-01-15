require 'rails_helper'

describe 'As a user' do
  describe 'The app knows if favorites are saved or not' do
    it 'should return an empty array if no favorites' do
      stub_omniauth
      user = create(:omniauth_mock_user, id: 1)
  
      has_location = File.read('spec/fixtures/location_search.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: has_location, headers: {})
  
      no_favs = File.read('spec/fixtures/empty_favs.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: no_favs, headers: {})


      facade = FavoritesFacade.list_favorites(user.id)

      expect(facade).to be_an Array
      expect(facade).to eq([])
    end

    it 'should return an array of existing favorites' do
      stub_omniauth
      user = create(:omniauth_mock_user, id: 1)
  
      has_location = File.read('spec/fixtures/location_search.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: has_location, headers: {})
  
      has_fav = File.read('spec/fixtures/get_favorite.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: has_fav, headers: {})

      the_fav = File.read('spec/fixtures/fav_show.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/businesses/X8TwUk9xb0kVp50N9QExGw')
        .to_return(status: 200, body: the_fav, headers: {})

      facade = FavoritesFacade.show_favorite('X8TwUk9xb0kVp50N9QExGw')

      expect(facade.id).to be_a String
      expect(facade.image).to be_a String
      expect(facade.location).to be_a String
      expect(facade.name).to be_a String
      expect(facade.phone).to be_a String
      expect(facade.url).to be_a String
    end
  end
end