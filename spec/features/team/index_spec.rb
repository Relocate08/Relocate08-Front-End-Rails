require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the teams page' do
    it 'I should see an app overview and team member contact info' do
      visit team_path

      expect(page).to have_content("Getting setup in a new home is like unpacking your suitcase after a vacation, tedious and time consuming. After you've spent time packing and traveling, the last thing you want to do is spend time researching utility companies, internet service providers, and social events. Relocate aims to ease the chaos of moving and provide a resource for you to discover services in your new hometown.")
      expect(page).to have_content('Hanna Davis')
      expect(page).to have_content('Zach Stearns')
      expect(page).to have_content('Dani Coleman')
      expect(page).to have_content('Jose Lopez')
      expect(page).to have_content('Chris Allbritton')
      expect(page).to have_content('John Kim')
      expect(page).to have_content('Brett Sherman')
      expect(page).to have_content('Hope Gochnour')
      expect(page).to have_content('Jake Heft')
      expect(page).to have_content('Kevin Cuadros')
      # expect(page).to have_link('Github', count: 10)
      # expect(page).to have_link('Linkedin', count: 10)
    end
  end
end
