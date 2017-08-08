require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @product = Product.create name: "Snazzy Carpet", quantity: 23, price: 57
      @badproduct = Product.create
      @category = Category.create
      @product.category = @category
    end


    it "should have a name" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:name]).to include("can't be blank")
    end
    it "should have a price" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:price]).to include("can't be blank")
    end
    it "should have a quantity" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:quantity]).to include("can't be blank")
    end
    it "should have a category" do
      expect(@product.category).to be_valid
      expect(@badproduct.errors.messages[:category]).to include("can't be blank")
    end
  end
end
