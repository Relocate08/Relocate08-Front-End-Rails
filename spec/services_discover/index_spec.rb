require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit the Services Discover page' do

    xit 'I see buttons to select what category to explore' do
      stub_omniauth
      @user = create(:omniauth_mock_user)
      visit root_path
      click_link 'Login with Google'

      # @user = create(:user, id: 1)
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/address'

      # expect(page).to have_content('Service Categories')
      # expect(page).to have_link('Utilites')
      # expect(page).to have_link('Entertainment')
    end
  end
end