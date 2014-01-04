# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    address "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    description "MyString"
  end
end
