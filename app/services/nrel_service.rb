class NrelService
  def initialize(zip)
    @zip = zip
  end

  def get_stations
    json("/api/alt-fuel-stations/v1/nearest.json")
  end

  private

  def json(url)
    response = conn.get(url) do |c|
      c.params[:fuel_type] = "ELEC,LPG"
      c.params[:location] = @zip
      c.params[:access] = "public"
    end
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.headers['X-API-KEY'] = ENV["alt_fuel_key"]
      f.params[:limit] = 15
      f.adapter Faraday.default_adapter
    end
  end

end
