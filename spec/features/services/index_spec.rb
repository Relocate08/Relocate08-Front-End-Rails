require 'rails_helper'

describe 'As a User' do
  describe 'When I have clicked a service category' do
    it 'should see all the businesses for that category' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/electric_search.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp?location=80211&service&type=Electricity").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

      visit '/80211/utilities'


      click_on 'Electricity'

      expect(current_path).to eq('/80211/utilities/Electricity')
      within(first('.business')) do
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