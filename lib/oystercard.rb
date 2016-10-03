class Oystercard
  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
  end

  def balance
    @balance
  end
end
