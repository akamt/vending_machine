require "spec_helper"

RSpec.describe Money do
  describe "#amount" do
    subject { Money.new().amount }

    it "0円が返ってくる" do
        is_expected.to eq 0
    end

    context "100円の場合" do
        is_expected.to eq 100
    end
  end
end
