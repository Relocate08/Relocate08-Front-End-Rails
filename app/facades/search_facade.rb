class SearchFacade
  def self.all_businesses(location, category, type)
    json = CategoryService.all_businesses(location, category, type)
    json[:data].map do |biz_data|
      Business.new(biz_data)
    end
  end

  def self.a_business(id)
    json = CategoryService.a_business(id)
    Business.new(json)
  end

  def self.location_exists(id)
    json = BackendService.location_exists(id)
    if json[:data].nil?
      [false, nil]
    else
      [true, json[:data][:attributes][:location]]
    end
  end
end
