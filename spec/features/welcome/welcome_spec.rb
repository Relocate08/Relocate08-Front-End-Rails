# frozen_string_literal: true

require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit /' do
    it 'I can follow the link the Our Team link' do
      visit root_path
      click_on 'The Team'
      expect(current_path).to eq(team_path)
    end
  end
end
