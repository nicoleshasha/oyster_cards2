require 'journey.rb'
describe Journey do
 subject(:journey) {described_class.new}
 let(:station) {double :station}

it "should be able to log the start of the journey" do
  expect(journey.start(station)).to eq station
end

it "should store journey" do
  journey.start(station)
  journey.end(station)
  expect(station.journey).to eq [station, station]
end

it "should recognize incomplete journeys" do
  journey.start(station)
  expect(journey.complete?).to eq false
end

it "should impose fine if journey is incomplete" do
  journey.start(station)
  expect(journey.fare).to eq FINE
end

it "should return normal fare if journey is completed" do
  journey.start(station)
  journey.end(station)
  expect(journey.fare).to eq MINIMUM_FARE
end
end
