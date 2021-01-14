require 'rails_helper'

describe 'As a logged in user' do
  describe 'When I click on a company from the service type index page' do
    before(:each) do
      @user = create(:user, id: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'I am taken to that companys show page to see their info' do
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

      expect(page).to have_content('Favorite this Business')
    end

    it 'I can favorite a business' do
      json_response = File.read('spec/fixtures/utilities/electric_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/utilities/electricity")
        .to_return(status: 200, body: json_response, headers: {})

      visit '/80211/utilities'

      click_on 'Electricity'

      visit '/80211/utilities/electricity'

      click_link 'Xcel Energy'
      expect(current_path).to eq('/businesses/9s8dfs7fsdmsdf')

      # create_fav = File.read('spec/fixtures/fav_business_create.json')
      # stub_request(:post, "https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1/9s8dfs7fsdmsdf?business_name=Xcel%20Energy")
      # .to_return(status: 200, body: create_fav, headers: {})

      # click_link 'Favorite this Business'

      # get_fav = File.read('spec/fixtures/get_favorite.json')
      # stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1")
      # .to_return(status: 200, body: get_fav, headers: {})

      # expect(current_path).to eq(dashboard_path)
      # expect(page).to have_content('Business Saved!')
    end
  end
end
