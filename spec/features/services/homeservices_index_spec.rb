require 'rails_helper'

describe 'As a User' do
  describe 'When I have clicked a service category' do
    it 'should see all the businesses for home cleaning' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/homeservices/homecleaning_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/homeservices/homecleaning")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/homeservices'

      click_on 'Home Cleaning'

      expect(current_path).to eq('/80211/homeservices/homecleaning')
      within(first('.business')) do
        expect(page).to have_content("Chris' Fancy Maids")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the businesses for landscaping' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/homeservices/landscaping_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/homeservices/landscaping")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/homeservices'

      click_on 'Landscaping'

      expect(current_path).to eq('/80211/homeservices/landscaping')
      within(first('.business')) do
        expect(page).to have_content("Chris' Scapers of Land")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the businesses for handyman' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/homeservices/handyman_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/homeservices/handyman")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/homeservices'

      click_on 'Handyman'

      expect(current_path).to eq('/80211/homeservices/handyman')
      within(first('.business')) do
        expect(page).to have_content("Chris' Handyman Service")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the businesses for damage restoration' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/homeservices/damagerestoration_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/homeservices/damagerestoration")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/homeservices'

      click_on 'Damage Restoration'

      expect(current_path).to eq('/80211/homeservices/damagerestoration')
      within(first('.business')) do
        expect(page).to have_content("Chris' Restoreers")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the businesses for locksmiths' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/homeservices/locksmiths_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/homeservices/locksmiths")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/homeservices'

      click_on 'Locksmiths'

      expect(current_path).to eq('/80211/homeservices/locksmiths')
      within(first('.business')) do
        expect(page).to have_content("Chris' Locksmiths")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the businesses for painters' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/homeservices/painters_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/homeservices/painters")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/homeservices'

      click_on 'Painters'

      expect(current_path).to eq('/80211/homeservices/painters')
      within(first('.business')) do
        expect(page).to have_content("Chris' Painters")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the businesses for plumbing' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/homeservices/plumbing_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/homeservices/plumbing")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/homeservices'

      click_on 'Plumbing'

      expect(current_path).to eq('/80211/homeservices/plumbing')
      within(first('.business')) do
        expect(page).to have_content("Chris' PlumBums")
        expect(page).to have_content(1.02)
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
