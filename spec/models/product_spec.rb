require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do #before each test create category and empty_product/product
      @category = Category.new(name:'AHHHHHHHHH')
      @product = Product.new()
    end

    it 'saves' do
      @product_save = Product.new(name: 'Some product', price: 50, quantity: 5, category: @category)
      @product_save.save
      expect(@product_save[:id]).to be_present #save successful if theres an id
    end

    it 'with name' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end

    it 'with price' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to include("can't be blank")
      expect(@product.errors.messages[:price]).to include("is not a number")
    end

    it 'with quantity' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end

    it 'with category' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to include("can't be blank")
    end
  end
end