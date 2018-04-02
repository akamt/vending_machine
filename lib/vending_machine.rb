require "vending_machine/version"

class VendingMachine
  def initialize(stocks=[])
    @value = 0
    @stocks = stocks
  end

  def money
    @value
  end

  def put_money(value)
    @value += value
  end

  def select(drink)
    stock = @stocks.find{|x| x[:name] == drink}
    if stock[:price] <= @value
      drink
    end
  end
end
