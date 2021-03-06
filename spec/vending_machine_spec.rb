require "spec_helper"

RSpec.describe VendingMachine do
  it "has a version number" do
    expect(VendingMachine::VERSION).not_to be nil
  end

  let(:machine) { VendingMachine.new }

  describe "#put_money" do
    subject { machine.put_money(money) }

    context "空の自動販売機に100円入れた場合" do
      let(:money) { Money.new(100) }

      it "自動販売機は100円持っている" do
        is_expected.to eq Money.new(100)
        expect(machine.money).to eq Money.new(100)
      end
    end

    context "空の自動販売機に200円入れた場合" do
      let(:money) { Money.new(200) }

      it "自動販売機は200円持っている" do
        is_expected.to eq Money.new(200)
        expect(machine.money).to eq Money.new(200)
      end
    end

    context "事前に100円入っている自動販売機に100円入れた場合" do
      before {
        machine.put_money(Money.new(100))
      }

      let(:money) { Money.new(100) }

      it "自動販売機は200円持っている" do
        is_expected.to eq Money.new(200)
        expect(machine.money).to eq Money.new(200)
      end
    end
  end

  describe "#select" do
    let(:stocks) {
      [
        Drink.new(name: "cola",    price: Money.new(150)),
        Drink.new(name: "ayataka", price: Money.new(130)),
      ]
    }
    let(:machine) { VendingMachine.new(stocks) }

    subject { machine.select(drink) }

    shared_context "1000円入れた状態" do
      before {
        machine.put_money(Money.new(1000))
      }
    end

    shared_examples "買えない" do
      it "買えない" do
        is_expected.to be_nil
      end
    end

    context "自動販売機でコーラを選んだ場合" do
      include_context "1000円入れた状態"

      let(:drink) {'cola'}

      it "自動販売機はコーラ出す" do
        is_expected.to eq 'cola'
      end
    end

    context "自動販売機で綾鷹を選んだ場合" do
      include_context "1000円入れた状態"

      let(:drink) {'ayataka'}

      it "自動販売機は綾鷹を出す" do
        is_expected.to eq 'ayataka'
      end
    end

    context "お金を入れていない場合" do
      let(:drink) {'ayataka'}

      include_examples "買えない"
    end

    context "在庫にない商品を選択した場合" do
      let(:drink) {'Mets cola'}

      include_examples "買えない"
    end

    context "100円入れた状態で綾鷹を選択した場合" do
      before {
        machine.put_money(Money.new(100))
      }

      let(:drink) {'ayataka'}

      include_examples "買えない"
    end
  end

  describe "#get_change" do
    let(:stocks) {
      [
        Drink.new(name: "cola",    price: Money.new(150)),
        Drink.new(name: "ayataka", price: Money.new(130)),
      ]
    }

    let(:machine) { VendingMachine.new(stocks) }
    subject { machine.get_change() }

    context "何も入れていない場合" do
      it "0円" do
        is_expected.to eq Money.new(0)
      end
    end

    context "100円入れた状態でお釣りを返す場合" do
      before {
        machine.put_money(Money.new(100))
      }

      it "100円が返ってくる" do
        is_expected.to eq Money.new(100)
      end
    end

    context "500円入れた状態で綾鷹を買った場合" do
      before {
        machine.put_money(Money.new(500))
        machine.select('ayataka')
      }

      it "370円返ってくる" do
        is_expected.to eq Money.new(370)
      end
    end

    context "500円入れた状態で綾鷹を買って、お釣りを返してもらった状態の場合" do
      before {
        machine.put_money(Money.new(500))
        machine.select('ayataka')
        machine.get_change
      }

      it "0円返ってくる" do
        is_expected.to eq Money.new(0)
        
      end
    end
  end
end
