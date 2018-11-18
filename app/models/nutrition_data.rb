class NutritionData
  attr_accessor :search

  URL = "https://api.nal.usda.gov/ndb".freeze

  def initialize(search)
    @search = search
  end

  def call
    ndbno = find_ndbno
    return [] if ndbno.blank?
    find_nutrition_data(ndbno)
  end

  private

  def find_ndbno
    params = {
      format: 'json',
      q: search,
      sort: 'n',
      max: 25,
      offset: 0,
      api_key: api_key
    }
    response = HTTP.get("#{URL}/search", params: params)
    data = JSON.parse(response.body.to_s)

    data.dig('list','item',0,'ndbno')
  end

  def find_nutrition_data(ndbno)
    params = {
      ndbno: ndbno,
      format: 'json',
      type: 'f',
      api_key: api_key
    }
    response = HTTP.get("#{URL}/V2/reports", params: params)
    data = JSON.parse(response.body.to_s)

    nutrients = data.dig('foods',0,'food','nutrients')
    return [] if nutrients.blank?
    format_nutrients(nutrients)
  end

  def format_nutrients(nutrients)
    nutrients.map do |nutrient|
      {
        name: nutrient['name'],
        group: nutrient['group'],
        unit: nutrient['unit'],
        value: nutrient['value'],
      }
    end
  end

  def api_key
    ENV.fetch("USDA_API_KEY", "DEMO_KEY")
  end
end