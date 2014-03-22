require 'spec_helper'

describe DemandAndProductReturn do

    let(:user) { FactoryGirl.create(:user) }
    before do
      @demand_and_product_return = DemandAndProductReturn.new(demand: "5", return: "5")
    end

    subject { @demand_and_product_return }

    it { should respond_to(:demand) }
    it { should respond_to(:return) }

    describe "when demand is not present" do
      before { @demand_and_product_return.demand = " " }
      it { should_not be_valid }
    end

    describe "when return is not present" do
      before { @demand_and_product_return.return = " " }
      it { should_not be_valid }
    end
  end