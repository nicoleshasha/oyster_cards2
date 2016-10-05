require_relative "journey.rb"

class Oystercard
  attr_reader :balance, :in_use, :journey, :journeys, :history
  DEFAULT_BALANCE = 5
  BALANCE_LIMIT = 90


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    fail "Total balance should not be more than 90" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Not enough funds" if @balance < 1
    @journey = Journey.new(entry_station)
    deduct_balance(journey.fine) if @in_use == true
    deduct_balance(journey.fare)
    @in_use = true
  end

  def touch_out(exit_station)
    @in_use = false
    @journey.end(exit_station)
    end

  def in_journey?
    @in_use
  end

private
  def deduct_balance(amount)
    @balance -= amount
  end
end
