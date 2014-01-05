require 'spec_helper'

feature 'associate building with owner', %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria:

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'assign an owner when creating a building'

  scenario 'deleting an owner means their properties are no longer associated'

end
