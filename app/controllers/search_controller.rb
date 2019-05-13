class SearchController < ApplicationController

  def index
    zip = params[:zip]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.headers['X-API-KEY'] = "0dOYB4LmtCxHWgZirbeS0a9PEIWaLlRriCFhKu1s"
      f.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1.json?fuel_type=ELEC,LPG&zip=#{zip}")

    @stations = JSON.parse(response.body, symbolize_names: true)
  end

end
