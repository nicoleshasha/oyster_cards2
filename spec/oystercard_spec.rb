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


end
