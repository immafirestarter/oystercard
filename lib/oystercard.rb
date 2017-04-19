require_relative "parameters"

class Oystercard
attr_reader :balance, :in_transit

  def initialize(balance = 0)
    @balance = balance
    @in_transit = false
  end

  def top_up(amount = 0)
    raise "Your balance cannot exceed #{MAX_BALANCE}. Your current balance is #{@balance}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount = 0)
    @balance -= amount
  end

  def touch_in
    raise "You are already in transit; please touch out before beginning a new journey." if @in_transit == true
    @in_transit = true
  end

  def touch_out
    @in_transit = false
  end

end
