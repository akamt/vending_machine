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
end
