class Oystercard

  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize(balance = 5)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise("Maximum balance is £#{MAXIMUM_BALANCE}") if (@balance + amount) >= MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    raise("Not enough funds") if @balance < 1
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
    deduct(1)
  end

  def deduct(fare)
    @balance -= fare
  end

end
