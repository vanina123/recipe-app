require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  before(:each) do
    @user= User.create(name: 'nana',
                        email: 'nina@gmail.com',
                        password: '1234567', password_confirmation: '1234567')
    @shiro = Food.create(name: 'Shiro', measurement_unit: 'KG', price: 45.99, quantity: 2, user: @user)
    sign_in @user
  end

  describe 'food index page' do
    it 'displays the food name' do
      visit '/foods'
      expect(page).to have_content('Shiro')
    end
  end

  describe 'navigation to new food form' do
    it 'takes the user to the new food form page' do
      visit '/foods'
      click_link 'Add New Food'
      expect(page).to have_current_path('/foods/new')
    end
  end
end