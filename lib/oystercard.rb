class Oystercard
  attr_reader :balance, :in_use, :journey, :journeys, :history
  DEFAULT_BALANCE = 5
  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_use = false
    @journey = []
    @journeys = []
    @history = {}
  end

  def top_up(amount)
    fail "Total balance should not be more than 90" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Not enough funds" if @balance < 1
    @in_use = true
    @journey << entry_station
  end

  def touch_out(exit_station)
    @in_use = false
    deduct_balance(MINIMUM_FARE)
    @journey << exit_station
    write_history
    @journey.clear
  end

  def write_history
    @journeys << @journey.dup
    @history = Hash[@journeys.map.with_index(1) { |x, i| [i, x] }]
  end

  def in_journey?
    @in_use
  end


def deduct_balance(amount)
  @balance -= amount
end
end
