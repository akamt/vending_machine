require "vending_machine/version"

class VendingMachine
  def initialize
    @value = 0
  end

  def money
    @value
  end

  def put_money(value)
    @value += value
  end
end
