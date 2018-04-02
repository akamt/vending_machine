class Money
  include Comparable

  def initialize(amount=0)
    @amount = amount
  end

  def amount
    @amount
  end

  def +(money)
    Money.new(@amount + money.amount)
  end

  def -(money)
    Money.new(@amount - money.amount)
  end

  def <=>(other)
    if !other.is_a?(Money)
      nil
    elsif @amount == other.amount
      0
    elsif @amount < other.amount
      -1
    elsif @amount > other.amount
      1
    end
  end
end
