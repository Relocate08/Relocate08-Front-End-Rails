require 'rails_helper'

describe 'As a logged in user' do
  it 'I can log out' do
    stub_omniauth
    @user = create(:omniauth_mock_user, id: 4)
    visit root_path

    first_login = File.read('spec/fixtures/location_search_null.json')
    stub_request(:get, "https://relocate-back-end-rails.herokuapp.com/api/v1/location/4").
         to_return(status: 200, body: first_login, headers: {})

    click_link 'Login with Google'


    save_and_open_page
  end
end