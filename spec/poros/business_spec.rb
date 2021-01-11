require 'rails_helper'

describe Business do
  it 'exists' do
    attr = {
			id: '9s8dfs7fsdmsdf',
      attributes: {
        name: 'Xcel Energy',
        image: 'https://s3-media1.fl.yelpcdn.com/bphoto/pDZ8YQ098hOq1RzwbFFyWA/o.jpg',
        url: 'https://www.yelp.com/biz/xcel-energy-denver?adjust_creative=zQj4oUhAlRBYo7eV2LOdZA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=zQj4oUhAlRBYo7eV2LOdZA',
        location: '1099 18th St, Ste 3000, Denver, CO 80202',
        phone: '(800) 895-4999',
        distance: 1.019879293317
      }
    }

    business = Business.new(attr)

    expect(business).to be_a(Business)
    expect(business.id).to eq('9s8dfs7fsdmsdf')
    expect(business.name).to eq('Xcel Energy')
    expect(business.image).to eq('https://s3-media1.fl.yelpcdn.com/bphoto/pDZ8YQ098hOq1RzwbFFyWA/o.jpg')
    expect(business.url).to eq('https://www.yelp.com/biz/xcel-energy-denver?adjust_creative=zQj4oUhAlRBYo7eV2LOdZA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=zQj4oUhAlRBYo7eV2LOdZA')
    expect(business.location).to eq('1099 18th St, Ste 3000, Denver, CO 80202')
    expect(business.phone).to eq('(800) 895-4999')
    expect(business.distance).to eq(1.019879293317)
  end
end