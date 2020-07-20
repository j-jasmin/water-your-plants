require 'rails_helper'

RSpec.describe 'Creating a watering event', type: :feature do
  scenario 'successfully' do
    login_as(FactoryBot.create(:user))
    plant = FactoryBot.build(:plant)
    visit new_plant_path
    fill_in 'plant[common_name]', with: 'Monstera', visible: false
    click_on 'Create Plant'
    visit root_path
    page.status_code == 200
    click_on " #{plant.common_name} "
    fill_in 'watering_event_date', with: '12/12/2019'
    click_on 'Create Watering event'
    page.status_code == 302
  end
end
