require 'rails_helper'

describe NrelService do
  it 'get_stations returns a Hash of fuel station info' do
    service = NrelService.new("80206")

    expect(service.get_stations).to be_a(Hash)
    expect(service.get_stations).to have_key(:total_results)
    expect(service.get_stations).to have_key(:fuel_stations)
  end
end
