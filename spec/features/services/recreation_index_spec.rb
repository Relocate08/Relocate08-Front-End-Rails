require 'rails_helper'

describe 'As a User' do
  describe 'When I have clicked a service category' do
    it 'should see all the gyms' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/gyms_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/gyms")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Gyms'

      expect(current_path).to eq('/80211/recreation/gyms')
      within(first('.business')) do
        expect(page).to have_content("John's Gym")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the yoga' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/yoga_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/yoga")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Yoga'

      expect(current_path).to eq('/80211/recreation/yoga')
      within(first('.business')) do
        expect(page).to have_content("John's Yoga Studio")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the parks' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/parks_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/parks")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Parks'

      expect(current_path).to eq('/80211/recreation/parks')
      within(first('.business')) do
        expect(page).to have_content("John's Park")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the hiking' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/hiking_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/hiking")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Hiking'

      expect(current_path).to eq('/80211/recreation/hiking')
      within(first('.business')) do
        expect(page).to have_content("John's Mountain")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the recreation' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/recreation_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/recreation")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Recreation'

      expect(current_path).to eq('/80211/recreation/recreation')
      within(first('.business')) do
        expect(page).to have_content("John's Rec Center")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the pools' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/pools_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/pools")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Pools'

      expect(current_path).to eq('/80211/recreation/pools')
      within(first('.business')) do
        expect(page).to have_content("John's Pool")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the golf' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/golf_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/golf")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Golf'

      expect(current_path).to eq('/80211/recreation/golf')
      within(first('.business')) do
        expect(page).to have_content("John's Golf Place")
        expect(page).to have_content(1.02)
      end
    end

    it 'should see all the playgrounds' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/recreation/playgrounds_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/80211/recreation/playgrounds")
        .to_return(status: 200, body: json_response, headers: {})
      visit '/80211/recreation'

      click_on 'Playgrounds'

      expect(current_path).to eq('/80211/recreation/playgrounds')
      within(first('.business')) do
        expect(page).to have_content("John's Playground")
        expect(page).to have_content(1.02)
      end
    end

  end
end
