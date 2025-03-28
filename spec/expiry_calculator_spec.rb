# frozen_string_literal: true

RSpec.describe ExpiryCalculator do
  subject { (Class.new { include ExpiryCalculator }).new }

  let(:test_data) {
    {
      one_day: DateTime.now + 1,
      two_day: DateTime.now + 2,
      three_months: Date.today + 90,
      one_year: Date.parse((Date.today + 365).to_s)
    }
  }

  it "has a version number" do
    expect(ExpiryCalculator::VERSION).not_to be nil
  end

  it "calculate difference in days for current and future expiry date" do
    expect(subject.calculate(test_data[:one_day])).to eq(1)
    expect(subject.calculate(test_data[:two_day])).to be_within(2).of(1)
    expect(subject.calculate(test_data[:three_months])).to eq(90)
    expect(subject.calculate(test_data[:one_year])).to eq(365)
  end

  it "handles expired dates correctly" do
    expect(subject.calculate(Date.yesterday)).to eq(0)
  end

  context "Arguments" do
    it "supports date parameter" do
    end

    it "supports datetime parameter" do
    end

    it "supports string parameters and do the conversion" do
    end

    it "supports active_record parameter with accessor attr" do
    end

    it "gives error with non supported type" do
      expect {
        subject.calculate(2020)
      }.to raise_error(ArgumentError, "record type not supported.")
    end
  end
end
