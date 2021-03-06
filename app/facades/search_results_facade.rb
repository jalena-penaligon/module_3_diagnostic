class SearchResultsFacade < ApplicationController
  def initialize(zip)
    @zip = zip
  end

  def station_count
    station_info[:total_results]
  end

  def closest_stations
    station_info[:fuel_stations].map do |station_info|
      Station.new(station_info)
    end
  end

  private

  def station_info
    @station_info ||= service.get_stations
  end

  def service
    @service ||= NrelService.new(@zip)
  end

end
