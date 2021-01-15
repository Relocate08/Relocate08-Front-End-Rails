require 'rails_helper'

describe 'As a user' do
	it 'I can see a list of local events' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		location = 80211
		
    visit '/80211/events'
    # click_on 'Events'
    # expect(current_path).to eq('/:location/events')

    # # events = 


    # within '.events' do
    #   # expect(event)
		# end
	end
end