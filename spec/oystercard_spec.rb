require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:station) {double :station}

  describe "#balance" do

    it "expects a default balance of 5" do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
    end

    it "expects a different balance value than the default value" do
      oyster = Oystercard.new(20)
      expect(oyster.balance).to eq 20
    end

  end

  describe "#top_up" do
    before do
      @balance = 5
    end

    it "allows the card to top-up certain amount" do
      expect(oystercard).to respond_to(:top_up).with(1).argument
    end

      it "expects the balance to increase by top-up amount" do
        expect{oystercard.top_up(16)}.to change {subject.balance}.by 16
      end

      it "raises and error if balance is more than 90" do
          amount = 100
          expect{oystercard.top_up(amount)}.to raise_error "Total balance should not be more than 90"
      end
end

describe '#touch_in' do
  it "allows a user to touch in at a station" do
    oystercard.touch_in(station)
    expect(oystercard.in_use).to eq true
  end

  it  "tests to see if passenger is in journey" do
    oystercard.touch_in(station)
    oystercard.in_journey?
    expect(oystercard.in_use).to eq true
end

  it "does not allow to touch in when balance is less than £1" do
    oyster1 = Oystercard.new(0)
    expect{oyster1.touch_in(station)}.to raise_error "Not enough funds"
  end

  it "tests to see if the origin station is stored" do
    expect(oystercard.journey).not_to be ""
  end
end

describe '#touch_out' do
  it "allows a user to touch out at a station" do
    oystercard.touch_in(station)
    oystercard.touch_out(station)
    expect(oystercard.in_use).to eq false
  end

  it "uses the deduct method to deduct the minimum fare when you touch out" do
    expect{oystercard.touch_in(station)}.to change {subject.balance}.by -1
  end
end
end
