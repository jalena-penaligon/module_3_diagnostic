require 'rails_helper'

describe Station, type: :model do
  subject { Station.new(attributes) }
  let(:attributes) {
  {
  	station_name: "Station Name",
  	street_address: "123 Street",
  	city: "Denver",
  	state: "CO",
    zip: "80206",
  	fuel_type_code: "ELEC",
  	distance: 0.9,
  	access_days_time: "24 hours a day"
  }
}
  it 'has attributes' do
    expect(subject.name).to eq("Station Name")
    expect(subject.address).to eq("123 Street Denver, CO 80206")
    expect(subject.fuel_type).to eq("ELEC")
    expect(subject.distance).to eq(0.9)
    expect(subject.access_times).to eq("24 hours a day")
  end

end
