require "spec_helper"

RSpec.describe Money do
  describe "#amount" do
    let(:money) { Money.new() }
    subject { money.amount }

    it "0円が返ってくる" do
      is_expected.to eq 0
    end

    context "100円の場合" do
      let(:money) { Money.new(100) }
      it "100になる" do
        is_expected.to eq 100
      end
    end

    context "500円の場合" do
      let(:money) { Money.new(500) }
      it "500になる" do
        is_expected.to eq 500
      end
    end
  end

  describe "#+" do
    subject { money_a + money_b }

    context "0円と100円を足す場合" do
      let(:money_a) { Money.new(0) }
      let(:money_b) { Money.new(100) }

      it {
        is_expected.to eq Money.new(100)
      }
    end

    context "100円と200円を足す場合" do
      let(:money_a) { Money.new(100) }
      let(:money_b) { Money.new(200) }

      it {
        is_expected.to eq Money.new(300)
      }
    end
  end
end
