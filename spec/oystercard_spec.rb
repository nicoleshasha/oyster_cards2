require 'oystercard'

describe Oystercard do

  before :each do
    @oystercard = Oystercard.new
  end

  describe '#top_up' do
    it 'Adds to the balance of the instance' do
      @oystercard.top_up(10)
      expect(@oystercard.balance).to eq(15)
    end
    it 'Limits the balance to £90' do
      expect { @oystercard.top_up(85) }.to raise_error("Maximum balance is £90")
    end
  end

  describe '#balance' do
    it 'Returns the balance on the card' do
      expect(@oystercard.balance).to eq(5)
    end
  end

  describe '#deduct' do
    it 'Deducts a certain fare from the balance' do
      expect(@oystercard.deduct(4)).to eq(1)
    end
  end

  describe '#touch_in' do
    it 'Changes the in_journey variable to true' do
      @oystercard.touch_in
      expect(@oystercard.in_journey?).to eq(true)
    end
    it 'Requires at least £1 to be able to travel' do
      @oystercard.deduct(4)
      expect(@oystercard.touch_in).to eq(true)
    end
    it 'Raises error if trying to travel with less than £1' do
      @oystercard.deduct(4.01)
      expect{ @oystercard.touch_in }.to raise_error("Not enough funds")
    end
  end

  describe '#touch_out' do
    it 'Changes the in_journey variable to false' do
      @oystercard.touch_in
      @oystercard.touch_out
      expect(@oystercard.in_journey?).to eq(false)
    end
  end
end
