require 'journey.rb'
describe Journey do
 subject(:journey) {described_class.new(station)}
 let(:station) {double :station}

it "should be able to log the start of the journey" do
  expect(journey.journey).to eq [station]
end

it "should store journey" do
  journey.end(station)
  expect(journey.journey).to eq [station, station]
end

it "should recognize incomplete journeys" do
  journey
  expect(journey.complete?).to eq false
end

it "should impose fine if journey is incomplete" do
  expect(journey.fine).to eq Journey::FINE
end

it "should return normal fare if journey is completed" do
  journey.end(station)
  expect(journey.fare).to eq Journey::MINIMUM_FARE
end
end
