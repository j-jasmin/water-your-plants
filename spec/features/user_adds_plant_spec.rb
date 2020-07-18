require 'rails_helper'

RSpec.describe 'Creating a plant', type: :feature do
  scenario 'valid name' do
    login_as(FactoryBot.create(:user))
    visit new_plant_path
    fill_in 'plant[name]', with: 'Monstera', visible: false
    click_on 'Create Plant'
    visit plants_path
    save_and_open_page
    expect(page).to have_content('Monstera')
  end
end
