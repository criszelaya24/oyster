require 'station'

describe Station do
	station = Station.new('Old Street', 1)
	#subject {described_class.new(name: "Old Street", zone: 1)}
	#it {expect(subject).to respond_to :zone}
	it 'Initialize its name' do
		expect(station.name).to eq("Old Street")
	end

	it 'Initialize its zone' do
		expect(station.zone).to eq(1)
	end
end