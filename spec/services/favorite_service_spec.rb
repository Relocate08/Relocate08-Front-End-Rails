require 'rails_helper'

describe FavoritesService do
  context 'class methods' do
    it '.conn' do
      stub_request(:get, 'https://relocate-back-end-rails.herokuapp.com/')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v1.3.0'
          }
        )
        .to_return(status: 200, body: '', headers: {})
    end
  end
end
