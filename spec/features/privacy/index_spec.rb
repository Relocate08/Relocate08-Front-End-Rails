require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the privacy policy page' do
    it 'I should see an the privacy policy' do
      visit privacy_path
      
      expect(page).to have_content("Relocate's Privacy Page")
      expect(page).to have_content('Privacy Notice:')
      expect(page).to have_content('When you sign in with your google account, we access your public google user information, but we will only store your google user id, name, and email in our database.')
    end
  end
end