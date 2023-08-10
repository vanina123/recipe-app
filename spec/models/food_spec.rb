require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create!(name: 'paul', email: 'paul@gmail.com', password: 'Password')
    @food = Food.create!(name: 'Beans', measurement_unit: 'Kg', price: 300, quantity: 2, user: @user )
  end

  it 'can be created' do
    expect(@food).to be_valid
  end

  it 'requires a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'requires a name with at least 2 characters' do
    @food.name = '' 
    expect(@food).to_not be_valid
  end
  
  it 'requires a name with at most 50 characters' do
    @food.name = '' * 51
    expect(@food).to_not be_valid
  end

  it 'requires a quantity' do
    @food.quantity = nil
    expect(@food).to_not be_valid
  end

  it 'requires a non-negative quantity' do
    @food.quantity = -1
    expect(@food).to_not be_valid
  end

  it 'requires a price' do
    @food.price = nil
    expect(@food).to_not be_valid
  end

  it 'requires a non-negative price' do
    @food.price = -1
    expect(@food).to_not be_valid
  end

  it 'requires a user' do
    @food.user = nil
    expect(@food).to_not be_valid
  end
end
