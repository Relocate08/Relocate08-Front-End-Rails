require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the privacy policy page' do
    it 'I should see an the privacy policy' do
      visit privacy_path
      
      expect(page).to have_content("Relocate's Privacy Notice:")
      expect(page).to have_content('When you sign in with your google account, we access your public google user information, but we will only store your google user id, name, and email in our database.')
      expect(page).to have_content('Your google contacts will not be stored or shared with any other entity.')
      expect(page).to have_content('Your information will be used to created a user profile for you on Relocate.')
      expect(page).to have_content('Locations you enter will also be saved to our database to provide you with the best user experience catered to your area.')
    end
  end
end