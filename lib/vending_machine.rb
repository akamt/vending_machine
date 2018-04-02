require "vending_machine/version"
require "drink"
require "money"

class VendingMachine
  DEFAULT_INSERTED_MONEY = Money.new(0)

  def initialize(stocks=[])
    init_inserted_money
    @stocks = stocks
  end

  def money
    @inserted_money
  end

  def put_money(inserted_money)
    @inserted_money += inserted_money
  end

  def select(drink)
    stock = @stocks.find{|x| x.name == drink}
    if stock && stock.price <= @inserted_money
      # 買える時
      @inserted_money -= stock.price
      drink
    end
  end

  def get_change
    @inserted_money.tap {|_|
      init_inserted_money
    }
  end

  private
  def init_inserted_money
    @inserted_money = DEFAULT_INSERTED_MONEY
  end
end
