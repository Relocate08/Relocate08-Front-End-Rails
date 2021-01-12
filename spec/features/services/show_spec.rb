require 'rails_helper'

describe 'As a logged in user' do
  describe 'When I click on a company from the service type index page' do
    it 'I am taken to that companys show page to see their info' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/electric_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/utilities/electricity")
        .to_return(status: 200, body: json_response, headers: {})

      visit '/80211/utilities'

      click_on 'Electricity'

      visit '/80211/utilities/electricity'

      click_link 'Xcel Energy'
      expect(current_path).to eq('/businesses/')

      within '.biz-info' do
        expect(page).to have_content('Xcel Energy')
        expect(page).to have_xpath("//img[contains(@src, 'https://s3-media1.fl.yelpcdn.com/bphoto/pDZ8YQ098hOq1RzwbFFyWA/o.jpg')]")
        expect(page).to have_link('See Xcel Energy on Yelp')
        expect(page).to have_content('1099 18th St, Ste 3000, Denver, CO, 80202')
        expect(page).to have_content('(800) 895-4999')
        expect(page).to have_content(1.02)
      end
    end
  end
end
