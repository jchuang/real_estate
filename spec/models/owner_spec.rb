require 'spec_helper'

describe Owner do

  let(:blanks) { [nil, ''] }

  it { should have_valid(:first_name).when('Sally', 'Neil') }
  it { should_not have_valid(:first_name).when(*blanks) }

  it { should have_valid(:last_name).when('Ride', 'Armstrong') }
  it { should_not have_valid(:last_name).when(*blanks) }

  it { should have_valid(:email).when('sally@ride.com',
    'neil.armstrong@gmail.com') }
  it { should_not have_valid(:email).when('sally@ride', '@gmail.com',
    'neil.armstrong') }
  it { should_not have_valid(:email).when(*blanks) }

  it { should have_many(:buildings).dependent(:nullify) }

end
