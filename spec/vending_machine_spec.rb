require "spec_helper"

RSpec.describe VendingMachine do
  it "has a version number" do
    expect(VendingMachine::VERSION).not_to be nil
  end

  let(:machine) { VendingMachine.new }

  describe "#put_money" do
    let(:money) { 100 }

    subject { machine.put_money(money) }

    context "空の自動販売機に100円入れた場合" do
      it "自動販売機は100円持っている" do
        is_expected.to eq 100
        expect(machine.money).to eq 100
      end
    end
  end
end
