require 'rails_helper'

describe 'As a User' do
  describe 'When I have clicked a service category' do
    it 'should see all the businesses for that category' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/electric_search.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/yelp?location=80211&service=utilities&type=electricity')
        .to_return(status: 200, body: json_response, headers: {})

      visit '/80211/utilities'

      click_on 'Electricity'

      expect(current_path).to eq('/80211/utilities/electricity')
      within(first('.business')) do
        expect(page).to have_content('Xcel Energy')
        expect(page).to have_content(1.02)
      end
    end
  end
end
