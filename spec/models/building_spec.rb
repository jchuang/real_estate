require 'spec_helper'

describe Building do

  let(:blanks) { [nil, ''] }

  it { should have_valid(:address).when('33 Harrison Ave.', '33 Harrison') }
  it { should_not have_valid(:address).when('Harrison Ave', '33') }
  it { should_not have_valid(:address).when(*blanks) }

  it { should have_valid(:city).when('Boston', 'Las Vegas') }
  it { should_not have_valid(:city).when(*blanks) }

  it { should have_valid(:state).when('MA', 'NY') }
  it { should_not have_valid(:state).when('Mass', 'Massachusetts') }
  it { should_not have_valid(:state).when(*blanks) }

  it { should have_valid(:zip_code).when('02111', '91789') }
  it { should_not have_valid(:zip_code).when('02111-1234', 'H2V 1X9') }
  it { should_not have_valid(:zip_code).when(*blanks) }

  it { should belong_to(:owner) }

end
