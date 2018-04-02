class Money
  def initialize(amount=0)
    @amount = amount
  end

  def amount
    @amount
  end

  def +(money)
    Money.new(@amount + money.amount)
  end

  def ==(other)
    @amount == other.amount
  end
end
