require 'rails_helper'

feature 'restaurants' do
  context 'No restaurants have been added' do
    scenario 'Should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end
