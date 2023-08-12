require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  describe 'Should render public recibies' do
    it 'should show the public recipies' do
      visit '/'
      expect(page).to have_content('Public')
    end
  end
end
