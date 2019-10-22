require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do #before each test create category and empty_product/product
      @category = Category.new(name:'AHHHHHHHHH')
      @product = Product.new(name: 'Some product', price: 50, quantity: 5, category: @category)
    end

    it 'saves' do
      @product.save
      expect(@product[:id]).to be_present #save successful if theres an id
    end

    it 'with name' do
      expect(@product.name).to be_present
    end

    it 'with price' do
      expect(@product.price).to be_present
    end
    it 'with quantity' do
      expect(@product.quantity).to be_present
    end
    it 'with category' do
      expect(@product.category).to be_present
    end
  end
end