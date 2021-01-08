# frozen_string_literal: true

require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit /' do
    it 'I should see' do
      app_description = "Moving to a new place is as exciting as it is stressful. Relocate was developed to help alleviate the stress so you can focus on settling in. What makes a home isn’t just the roof you sleep under, but the neighborhood around you. The average person moves approximately 11.7 times in their lifetime, and that means new gyms, new utilities, and new health care providers, among other things. Relocate's user-friendly interface is a quick way to find and compare all the local businesses and necessities around you based on the location you provide."
      visit root_path

      expect(page).to have_content('Welcome to Relocate')
      expect(page).to have_link('Login with Google')
      expect(page).to have_content(app_description)
      expect(page).to have_link('Privacy Policy')
    end

    it "Google OAuth logs in new user" do
      user_count = User.count
      expect(user_count).to eq(0)

      stub_omniauth
      user_count = User.count
      expect(user_count).to eq(0)

      visit root_path

      click_link 'Login with Google'

      user_count = User.count
      expect(user_count).to eq(1)
      user = User.first

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_link('Log Out')
    end

    it 'Returning Google user is logged in' do
      stub_omniauth
      user = create(:omniauth_mock_user)
      user_count = User.count
      expect(user_count).to eq(1)
  
      visit root_path
  
      click_link 'Login with Google'
  
      user_count = User.count
      expect(user_count).to eq(1)
  
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_link 'Log Out'
    end
  end
end
