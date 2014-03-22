require 'spec_helper'

describe ProductionParameter do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @production_parameter = ProductionParameter.new(production_cost: "5", production_time: "5", setup_cost: "5", setup_time: "5", holding_cost: "5", initial_inventory: "5")
  end

  subject { @production_parameter }

  it { should respond_to(:production_cost) }
  it { should respond_to(:production_time) }
  it { should respond_to(:setup_cost) }
  it { should respond_to(:setup_time) }
  it { should respond_to(:holding_cost) }
  it { should respond_to(:initial_inventory) }

  describe "when production cost is not present" do
    before { @production_parameter.production_cost = " " }
    it { should_not be_valid }
  end

  describe "when production time is not present" do
    before { @production_parameter.production_time = " " }
    it { should_not be_valid }
  end

  describe "when setup cost is not present" do
    before { @production_parameter.setup_cost = " " }
    it { should_not be_valid }
  end

  describe "when setup time is not present" do
    before { @production_parameter.setup_time = " " }
    it { should_not be_valid }
  end

  describe "when holding cost is not present" do
    before { @production_parameter.holding_cost = " " }
    it { should_not be_valid }
  end

  describe "when initial inventory is not present" do
    before { @production_parameter.initial_inventory = " " }
    it { should_not be_valid }
  end

  describe "when production cost is negative" do
    before { @production_parameter.production_cost = "-1" }
    it { should_not be_valid }
  end

  describe "when production time is negative" do
    before { @production_parameter.production_time = "-1" }
    it { should_not be_valid }
  end

  describe "when setup cost is negative" do
    before { @production_parameter.setup_cost = "-1" }
    it { should_not be_valid }
  end

  describe "when setup time is negative" do
    before { @production_parameter.setup_time = "-1" }
    it { should_not be_valid }
  end

  describe "when holding cost is negative" do
    before { @production_parameter.holding_cost = "-1" }
    it { should_not be_valid }
  end

  describe "when initial inventory is negative" do
    before { @production_parameter.initial_inventory = "-1" }
    it { should_not be_valid }
  end

end