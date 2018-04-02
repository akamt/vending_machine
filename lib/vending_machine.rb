require "vending_machine/version"
require "drink"

class VendingMachine
  DEFAULT_INSERTED_MONEY = 0

  def initialize(stocks=[])
    init_value
    @stocks = stocks
  end

  def money
    @value
  end

  def put_money(value)
    @value += value
  end

  def select(drink)
    stock = @stocks.find{|x| x.name == drink}
    if stock && stock.price <= @value
      # 買える時
      @value -= stock.price
      drink
    end
  end

  def get_change
    @value.tap {|_|
      init_value
    }
  end

  private
  def init_value
    @value = DEFAULT_INSERTED_MONEY
  end
end
