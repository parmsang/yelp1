require 'rails_helper'

feature 'restaurants' do
  context 'No restaurants have been added' do
    scenario 'Should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
  context 'Restaurants have been added' do
    before(:each) {Restaurant.create(name: 'KFC')}
    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content 'No restaurants yet'
    end
  end
  context 'creating restaurants' do
    scenario 'prompts user to fill out form, then displays the new restaurant' do
      visit 'restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end
  end
end
