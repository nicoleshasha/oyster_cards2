require 'journeylog.rb'

describe JourneyLog do
subject(:journeylog){described_class.new}
let(:station) {double :station}
let(:journey) {double :journey}

  it "should start with empty journeys" do
    expect(subject.journeys).to eq []
  end

  it "should start with empty history" do
    expect(subject.history).to be_empty
  end

  it "should start a journey" do
    expect(subject.start(station)).to be_an_instance_of(Journey)
  end

  it "should end a journey" do
    subject.start(station)
    expect(subject.end(station)).to eq [station, station]
end
end
