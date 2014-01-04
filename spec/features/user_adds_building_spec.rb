require 'spec_helper'

feature 'user adds a building', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do

  # Acceptance Criteria:

  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'all required information is provided' do
    visit 'buildings/new'

    fill_in 'Address', with: '1 Broadway'
    fill_in 'City', with: 'Cambridge'
    fill_in 'State', with: 'MA'
    fill_in 'Zip Code', with: '02142'
    fill_in 'Description', with: 'includes the CIC and General Assembly'

    click_on 'Create Building'
    expect(page).to have_content 'Building was created successfully.'
    expect(page).to have_content 'New Building'
  end

  end