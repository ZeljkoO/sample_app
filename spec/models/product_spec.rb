require 'spec_helper'

  describe Product do

    let(:user) { FactoryGirl.create(:user) }
    before do
      @product = Product.new(name: "A", product_family: "B")
    end

    subject { @product }

    it { should respond_to(:name) }
    it { should respond_to(:product_family) }

    describe "when name is not present" do
      before { @product.name = " " }
      it { should_not be_valid }
    end

    describe "when product family is not present" do
      before { @product.product_family = " " }
      it { should_not be_valid }
    end

    describe "when product name is already existent" do
      before do
        product_with_same_name = @product.dup
        product_with_same_name.name = @product.name
        product_with_same_name.save
      end
      it { should_not be_valid }
    end
  end

