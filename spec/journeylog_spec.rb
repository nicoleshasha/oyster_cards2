require 'journeylog.rb'

describe JourneyLog do
subject(:journeylog){described_class.new}

  it "should start with empty journeys" do
    expect(subject.journeys).to eq []
  end

  it "should start with empty history" do
    expect(subject.history).to be_empty
  end
end
