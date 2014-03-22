require 'spec_helper'

describe RemanufacturingParameter do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @remanufacturing_parameter = RemanufacturingParameter.new(remanufacturing_cost: "5", remanufacturing_time: "5", setup_cost: "5", setup_time: "5", holding_cost: "5", initial_inventory: "5")
  end

  subject { @remanufacturing_parameter }

  it { should respond_to(:remanufacturing_cost) }
  it { should respond_to(:remanufacturing_time) }
  it { should respond_to(:setup_cost) }
  it { should respond_to(:setup_time) }
  it { should respond_to(:holding_cost) }
  it { should respond_to(:initial_inventory) }

  describe "when remanufacturing cost is not present" do
    before { @remanufacturing_parameter.remanufacturing_cost = " " }
    it { should_not be_valid }
  end

  describe "when remanufacturing time is not present" do
    before { @remanufacturing_parameter.remanufacturing_time = " " }
    it { should_not be_valid }
  end

  describe "when setup cost is not present" do
    before { @remanufacturing_parameter.setup_cost = " " }
    it { should_not be_valid }
  end

  describe "when setup time is not present" do
    before { @remanufacturing_parameter.setup_time = " " }
    it { should_not be_valid }
  end

  describe "when holding cost is not present" do
    before { @remanufacturing_parameter.holding_cost = " " }
    it { should_not be_valid }
  end

  describe "when initial inventory is not present" do
    before { @remanufacturing_parameter.initial_inventory = " " }
    it { should_not be_valid }
  end
end