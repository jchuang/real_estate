require 'spec_helper'

feature 'associate building with owner', %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria:

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'buildings can be associated with an owner' do
    owner1 = FactoryGirl.create(:owner)
    owner2 = FactoryGirl.create(:owner)

    building1 = FactoryGirl.create(:building, owner: owner1)
    building2 = FactoryGirl.create(:building, owner: owner1)
    building3 = FactoryGirl.create(:building, owner: nil)

    visit owner_path(owner1)
    expect(page).to have_content building1.address
    expect(page).to have_content building2.address

    visit owner_path(owner2)
    expect(page).to_not have_content 'Harrison Ave.'
  end

  scenario 'deleting an owner means their properties are no longer associated' do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.create(:building, owner: owner)

    visit building_path(building)
    expect(page).to have_content "Owner: #{ owner.first_name } #{ owner.last_name }"

    owner.destroy
    building.reload

    visit building_path(building)
    expect(page).to have_content 'Owner: not recorded'
  end

end
