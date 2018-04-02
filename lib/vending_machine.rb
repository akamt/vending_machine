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
      # 買える時
      @value -= stock[:price]
      drink
    end
  end

  def get_change
    change = @value
    @value = 0
    change
  end
end
