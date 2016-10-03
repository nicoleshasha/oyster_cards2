class Oystercard

  attr_reader :balance

  def initialize(balance = 5)
    @balance = balance
  end

  def top_up(amount)
    raise("Maximum balance is £90") if (@balance + amount) >= 90 
    @balance += amount
  end

end
