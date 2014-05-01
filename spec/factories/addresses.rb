# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    line1 "My Street name"
    line2 "MyString"
    city "Denver"
    state "CO"
    zip "80301"
    user
  end
end
