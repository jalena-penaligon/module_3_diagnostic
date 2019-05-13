class SearchController < ApplicationController

  def index
    zip = params[:zip]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.headers['X-API-KEY'] = "0dOYB4LmtCxHWgZirbeS0a9PEIWaLlRriCFhKu1s"
      f.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel_type=ELEC,LPG&location=#{zip}&radius=5.0&access=public")

    @stations = JSON.parse(response.body, symbolize_names: true)
  end

end
