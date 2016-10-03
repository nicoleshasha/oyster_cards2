class Oystercard
  attr_reader :entry_station
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize(balance = 5)
    @balance = balance
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    raise("Maximum balance is £#{MAXIMUM_BALANCE}") if (@balance + amount) >= MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station_of_origin = 'station_of_origin')
    raise("Not enough funds") if @balance < 1
    @in_journey = true
    @entry_station = station_of_origin
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
    deduct(1)
    @entry_station = nil
  end

  private
    def deduct(fare)
      @balance -= fare
    end

end
