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
    expect(ExpiryCalculator::VERSION).to be_kind_of String
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
    let(:string_param) { (Date.today + 5).to_s }
    let(:date_param) { Date.today + 1 }
    let(:datetime_param) { DateTime.new(2020, 10, 10) }
    let(:active_record_class) do
      Class.new(ActiveRecord::Base) { self.table_name = "post_table" }
    end
    let(:active_record_param) { active_record_class.new(post_date: Date.today + 10) }

    establish_coonection

    before { up }
    after { down }

    it "supports date parameter" do
      expect(subject.calculate(date_param)).to eq(1)
    end

    it "supports datetime parameter" do
      expect(subject.calculate(datetime_param)).to eq(0)
    end

    it "supports string parameters and do the conversion" do
      expect(subject.calculate(string_param)).to eq(5)
    end

    it "supports active_record parameter with accessor attr" do
      expect(subject.calculate(active_record_param, :post_date)).to eq(10)
    end

    it "gives error with non supported type" do
      expect {
        subject.calculate(2020)
      }.to raise_error(ArgumentError, "record type not supported.")
    end
  end
end
