require 'rails_helper'

describe 'As a logged in user' do
  describe 'When I click on a company from the service type index page' do
    it 'I am taken to that companys show page to see their info' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)
  
      first_login = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: first_login, headers: {})
  
      no_favs = File.read('spec/fixtures/empty_favs.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: no_favs, headers: {})
  
      visit root_path
      click_link 'Login with Google'


      json_response = File.read('spec/fixtures/utilities/electric_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/utilities/electricity")
        .to_return(status: 200, body: json_response, headers: {})

      visit '/80211/utilities'

      click_on 'Electricity'

      visit '/80211/utilities/electricity'

      click_link 'Xcel Energy'
      expect(current_path).to eq('/businesses/9s8dfs7fsdmsdf')

      within '.biz-info' do
        expect(page).to have_content('Xcel Energy')
        expect(page).to have_link('See Xcel Energy on Yelp')
        expect(page).to have_content('1099 18th St, Ste 3000, Denver, CO, 80202')
        expect(page).to have_content('(800) 895-4999')
        expect(page).to have_content(1.02)
      end
    end

    it 'I can favorite a business' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)
  
      first_login = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: first_login, headers: {})
  
      no_favs = File.read('spec/fixtures/empty_favs.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: no_favs, headers: {})
  
      visit root_path
      click_link 'Login with Google'


      json_response = File.read('spec/fixtures/utilities/electric_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/utilities/electricity")
        .to_return(status: 200, body: json_response, headers: {})

      visit '/80211/utilities'

      click_on 'Electricity'

      visit '/80211/utilities/electricity'

      click_link 'Xcel Energy'
      expect(current_path).to eq('/businesses/9s8dfs7fsdmsdf')

      create_fav = File.read('spec/fixtures/fav_business_create.json')
      stub_request(:post, "https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1/9s8dfs7fsdmsdf?business_name=Xcel%20Energy")
      .to_return(status: 200, body: create_fav, headers: {})

      click_on('favorite')

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Business Saved!')
    end

    it 'I can delete a favorited business' do
      stub_omniauth
      @user = create(:omniauth_mock_user, id: 1)
  
      first_login = File.read('spec/fixtures/location_search_null.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
        .to_return(status: 200, body: first_login, headers: {})
  
      get_favs = File.read('spec/fixtures/get_favorite.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
        .to_return(status: 200, body: get_favs, headers: {})
  
      visit root_path
      click_link 'Login with Google'

      expect(page).to have_link('Xcel Energy')
      find('.delete-img').click
      expect(current_path).to eq(dashboard_path)
    end
  end
end
