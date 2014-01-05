require 'spec_helper'

feature 'user adds an owner', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  # Acceptance Criteria:

  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'all required information is provided' do
    visit 'owners/new'

    fill_in 'First Name', with: 'Ollie'
    fill_in 'Last Name', with: 'Owner'
    fill_in 'Email Address', with: 'ollie@example.com'

    click_on 'Create Owner'
    expect(page).to have_content 'Owner was successfully created.'
    expect(page).to have_content 'New Owner'
  end

  scenario 'required information is missing or invalid'

end
