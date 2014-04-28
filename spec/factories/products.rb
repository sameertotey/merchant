# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "MyString"
    price "9.99"
    description "MyText"
    image_url "MyString"
  end
end
