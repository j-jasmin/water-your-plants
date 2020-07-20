require 'rails_helper'

RSpec.describe 'Creating a watering event', type: :feature do
  before do
    login_as(FactoryBot.create(:user))
    @plant = FactoryBot.build(:plant)
    @plant.update_attribute(:id, 7)
  end

  scenario 'successfully' do
    visit new_plant_path
    fill_in 'plant[common_name]', with: 'Monstera', visible: false
    click_on 'Create Plant'
    visit root_path
    page.status_code == 200
    visit "plants/#{@plant.id}"
    fill_in 'watering_event_date', with: '12/12/2019'
    click_on 'Create Watering event'
    page.status_code == 302
  end
end
