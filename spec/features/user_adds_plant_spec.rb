require 'rails_helper'

RSpec.describe 'Creating a plant', type: :feature do
  scenario 'valid name' do
    login_as(FactoryBot.create(:user))
    visit new_plant_path
    fill_in 'plant[common_name]', with: 'Monstera', visible: false
    fill_in 'plant[watering_interval]', with: 10, visible: false
    click_on 'Add Plant'
    visit plants_path
    expect(page).to have_content('Monstera')
  end
end
