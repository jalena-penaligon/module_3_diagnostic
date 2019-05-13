class Station
  def initialize(attributes)
    @name = attributes[:station_name]
    @address = "#{attributes[:street_address]} #{attributes[:city]}, #{attributes[:state]} #{attributes[:zip]}"
    @fuel_type = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end
end
