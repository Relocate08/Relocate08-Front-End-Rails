require 'rails_helper'

describe 'As a logged in user' do
  describe 'When I click on a company from the service type index page' do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    
    it 'I am taken to that companys show page to see their info' do
      json_response = File.read('spec/fixtures/show_business_page.json')
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/businesses/9s8dfs7fsdmsdf').
  
        to_return(status: 200, body: json_response, headers: {})

      visit '/businesses/9s8dfs7fsdmsdf'

      within '.biz-info' do
        expect(page).to have_content('Xcel Energy')
        expect(page).to have_xpath("//img[contains(@src, 'https://s3-media1.fl.yelpcdn.com/bphoto/pDZ8YQ098hOq1RzwbFFyWA/o.jpg')]")
        expect(page).to have_link('See Xcel Energy on Yelp')
        expect(page).to have_content('1099 18th St, Ste 3000, Denver, CO, 80202')
        expect(page).to have_content('(800) 895-4999')
        expect(page).to have_content(1.02)
      end

      expect(page).to have_link('Favorite this Business')
    end

    it 'I can save that business and see saved businesses' do
      json_response = File.read('spec/fixtures/show_business_page.json')
      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/yelp/businesses/9s8dfs7fsdmsdf").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v1.3.0'
        }).
      to_return(status: 200, body: json_response, headers: {})

      visit '/businesses/9s8dfs7fsdmsdf'

      json_response = File.read('spec/fixtures/favorite_business.json')
      stub_request(:post, "https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/#{@user.id}/9s8dfs7fsdmsdf?business_name=Xcel%20Energy").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Length'=>'0',
        'User-Agent'=>'Faraday v1.3.0'
        }).
      to_return(status: 200, body: json_response, headers: {})


      click_link('Favorite this Business')
      
      expect(current_path).to eq('/businesses/9s8dfs7fsdmsdf')
      expect(page).to have_content('Business Saved!')


      visit '/dashboard'

      stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/#{@user.id}").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Length'=>'0',
        'User-Agent'=>'Faraday v1.3.0'
        }).
      to_return(status: 200, body: json_response, headers: {})

      expect(page).to have_content('Xcel Energy')
    end
  end
end
