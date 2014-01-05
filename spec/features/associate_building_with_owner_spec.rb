require 'spec_helper'

feature 'associate building with owner', %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria:

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'assign an owner when creating a building' do
    owner1 = FactoryGirl.create(:owner)
    owner2 = FactoryGirl.create(:owner)

    building1 = FactoryGirl.create(:building, owner: owner1)
    building2 = FactoryGirl.create(:building, owner: owner1)
    building3 = FactoryGirl.create(:building, owner: nil)

    visit "owners/#{owner1.id}"
    expect(page).to have_content building1.address
    expect(page).to have_content building2.address

    visit "owners/#{owner2.id}"
    expect(page).to_not have_content 'Boston'
  end

  scenario 'deleting an owner means their properties are no longer associated'

end
