require 'rails_helper'

describe 'As a User' do
  describe 'When I have clicked a service category' do
    it 'should see all the businesses for that category' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/utilities/electric_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/utilities/electricity")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/utilities'

      click_on 'Electricity'

      expect(current_path).to eq('/80211/utilities/electricity')
      within(first('.business')) do
        expect(page).to have_content('Xcel Energy')
        expect(page).to have_content(1.02)
      end
    end

    it 'can click another category for isp' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/utilities/isps.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/utilities/isps")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/utilities'

      click_on 'Internet Providers'

      expect(current_path).to eq('/80211/utilities/isps')
      within(first('.business')) do
        expect(page).to have_content("Zachs Dope Fiber")
        expect(page).to have_content(4)
      end
    end
    it "can not be accessed if not logged in" do

      visit '/dashboard'
      expect(current_path).to eq("/")

      within(".custom-alert") do
        expect(page).to have_content("You must be logged in")
      end
    end
  end
end
