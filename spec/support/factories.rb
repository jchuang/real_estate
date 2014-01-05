FactoryGirl.define do

  factory :building do
    sequence(:address, 33) { |n| "#{n} Harrison Ave." }
    city 'Boston'
    state 'MA'
    zip_code '02111'
    description 'Launch Academy'

    association :owner, factory: :owner
  end

  factory :owner do
    first_name 'Ollie'
    last_name 'Owner'
    sequence(:email) { |n| "owner#{n}@example.com" }
    company_name 'Some Company'
  end

end
