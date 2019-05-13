class NrelService
  def initialize(zip)
    @zip = zip
  end

  def get_stations
    json("/api/alt-fuel-stations/v1/nearest.json?fuel_type=ELEC,LPG&location=#{@zip}&radius=5.0&access=public")
  end

  private

  def json(url)
    response = conn.get(url)
    data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.headers['X-API-KEY'] = ENV["alt_fuel_key"]
      f.adapter Faraday.default_adapter
    end
  end

end
