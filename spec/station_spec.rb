require "station.rb"

describe Station do
  subject(:station) {described_class.new("old street", 2)}

it "should have a name" do
  expect(subject.name).to eq "old street"
end

it "should have a zone" do
  expect(subject.zone).to eq 2
end
end
