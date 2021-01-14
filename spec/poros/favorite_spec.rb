require 'rails_helper'

describe 'Favorite' do
  it 'exists' do
    attr = {
      "id": '1',
      "type": 'favorites',
      "attributes": {
        "user_id": 4,
        "yelp_business_id": 'this-is-a-yelp-biz-id',
        "business_name": 'The Business'
      }
    }

    favorite = Favorite.new(attr)

    expect(favorite).to be_a(Favorite)
    expect(favorite.business_name).to eq('The Business')
    expect(favorite.yelp_business_id).to eq('this-is-a-yelp-biz-id')
  end
end
