require 'rails_helper'

describe 'As a User' do
  describe 'When I have clicked a service category' do
    it 'should see all the businesses for that category' do
      json_response = File.read('spec/fixtures/electric_search.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/80211/utilities/electricity').to_return(status: 200, body: json_response, headers: {})
      visit '/80211/utilities'

      click_on 'Electricity'

      expect(current_path).to eq('/80211/utilities/electricity')
      within(first('#business')) do
        expect(page).to have_content('Xcel Energy')
        expect(page).to have_xpath("//img[contains(@src, 'https://s3-media1.fl.yelpcdn.com/bphoto/pDZ8YQ098hOq1RzwbFFyWA/o.jpg')]")
        expect(page).to have_link('https://www.yelp.com/biz/xcel-energy-denver?adjust_creative=zQj4oUhAlRBYo7eV2LOdZA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=zQj4oUhAlRBYo7eV2LOdZA')
        expect(page).to have_content('1099 18th St, Ste 3000, Denver, CO, 80202')
        expect(page).to have_content('(800) 895-4999')
        expect(page).to have_content(1.02)
      end
    end
  end
end