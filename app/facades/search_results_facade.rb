class SearchResultsFacade
  def initialize(zip)
    @zip = zip
  end

  def stations
    station_info.map do |station_info|
      Station.new(station_info)
    end
  end

  private

  def station_info
    service.get_stations
  end

  def service
    NrelService.new(@zip)
  end

end
