require 'rails_helper'

RSpec.describe Product, type: :model do
    before do
      @category = Category.create(name: 'Furniture')
    end

    describe 'Validations' do
      it "it is not valid without a name" do
        @product = Product.create(price: 987.65, quantity: 2, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it "it is not valid without a price" do
        @product = Product.create(name: "Electric Chair", quantity: 2, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it "it is not valid without a quantity" do
        @product = Product.create(name: "Electric Chair", price: 987.65, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it "it is not valid without a category" do
        @product = Product.create(name: "Electric Chair", price: 987.65, quantity: 2)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it "should have the validation name, price, quantity and category present" do
        @product = Product.create(name: "Electric Chair", price: 987.65, quantity: 2, category: @category)
        expect(@product).to be_valid
      end

    end
  end