require "spec_helper"

RSpec.describe Drink do
  describe "#name" do
    let(:name)  { "cola" }
    let(:drink) { Drink.new(name: name, price: 100) }

    subject { drink.name }

    it "名前が取得できる" do
      is_expected.to eq "cola"
    end
  end

  describe "#price" do
    let(:name)  { "cola" }
    let(:price) { 100 }
    let(:drink) { Drink.new(name: name, price: price) }

    subject { drink.price }

    it "価格が取得できる" do
      is_expected.to eq 100
    end
  end
end
