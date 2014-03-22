require 'spec_helper'

describe Period do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @period = Period.new(number: "1", capacity: "1", remanufacturing_capacity: "1")
  end

  subject { @period }

  it { should respond_to(:number) }
  it { should respond_to(:capacity) }
  it { should respond_to(:remanufacturing_capacity) }

  describe "when number is not present" do
    before { @period.number = " " }
    it { should_not be_valid }
  end

  describe "when capacity is not present" do
    before { @period.capacity = " " }
    it { should_not be_valid }
  end

  describe "when remanufacturing capacity is not present" do
    before { @period.remanufacturing_capacity = " " }
    it { should_not be_valid }
  end

  describe "when period number is already existent" do
    before do
      period_with_same_number = @period.dup
      period_with_same_number.number = @period.number
      period_with_same_number.save
    end
    it { should_not be_valid }
  end
end