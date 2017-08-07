require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # before :each do
  #   @category = Category.create( name: 'Food')
  #   @product = @category.products.create(
  #     name: 'Hot Dog',
  #     price: 10,
  #     quantity: 1,
  #     category: @category)
  #   @badproduct = Product.create
  # end

  describe 'Validations' do
    # validation tests/examples here

    describe 'Product.save' do
      it 'should save properly' do
        @category = Category.create( name: 'Food')
        @product = @category.products.create(
          name: 'Hot Dog',
          price: 10,
          quantity: 1,
          category: @category
        )
        expect(@product).to be_valid
      end
    end

    it 'should have a name' do
      @category = Category.create( name: 'Food')
      @product = @category.products.create(
        name: nil,
        price: 10,
        quantity: 1,
        category: @category
      )
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end

    it 'should have a price' do
      @category = Category.create( name: 'Food' )
      @product = @category.products.create(
        name: 'Hot Dog',
        price: nil,
        quantity: 1,
        category: @category
      )
      expect(@product.errors.messages[:price]).to include("can't be blank")
    end

    it 'should have a quantity' do
      @category = Category.create( name: 'Food' )
      @product = @category.products.create(
        name: 'Hot Dog',
        price: 10,
        quantity: nil,
        category: @category
      )
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end

    it 'should have a category' do
      @product = Product.create(
        name: 'Hot Dog',
        price: 10,
        quantity: 1,
        category: nil
      )
      expect(@product.errors.messages[:category]).to include("can't be blank")
    end
  end

end
