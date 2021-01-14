require 'rails_helper'

describe 'As a logged in user' do
  it 'I can log out' do
    stub_omniauth
    @user = create(:omniauth_mock_user, id: 1)

    first_login = File.read('spec/fixtures/location_search_null.json')
    stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/location/1')
      .to_return(status: 200, body: first_login, headers: {})

    no_favs = File.read('spec/fixtures/empty_favs.json')
    stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/api/v1/favorites/1')
      .to_return(status: 200, body: no_favs, headers: {})

    visit root_path

    click_link 'Login with Google'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout #{@user.name}")

    click_link("Logout #{@user.name}")
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Login with Google')
  end
end

Tip: Based on detected gems, the following RuboCop extension libraries might be helpful:
  * rubocop-rspec (http://github.com/rubocop-hq/rubocop-rspec)

You can opt out of this message by adding the following to your config (see https://docs.rubocop.org/rubocop/extensions.html#extension-suggestions for more options):
  AllCops:
    SuggestExtensions: false
