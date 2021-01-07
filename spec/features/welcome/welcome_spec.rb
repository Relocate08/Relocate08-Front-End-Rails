# frozen_string_literal: true

require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit /' do
    it 'I should see' do
      app_description = "Moving to a new place is as exciting as it is stressful. Relocate was developed to help alleviate the stress so you can focus on settling in. What makes a home isn’t just the roof you sleep under, but the neighborhood around you. The average person moves approximately 11.7 times in their lifetime, and that means new gyms, new utilities, and new health care providers, among other things. Relocate's user-friendly interface is a quick way to find and compare all the local businesses and necessities around you based on the location you provide."
      visit '/'

      expect(page).to have_content('Welcome to Relocate')
      expect(page).to have_link('Login with Google')
      expect(page).to have_content(app_description)
      expect(page).to have_link('Privacy Policy')
    end

    xit "starts the oauth process when you click on the 'Login with Google' link" do
      visit '/'
      click_link('Login with Google')
      expect(current_path).to eq('/auth/google_oath2')
    end
  end
end
