# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "My Sample Product"
    price "2.99"
    description "This is my sample product in the product store"
    image_url "image.jpg"
  end
end
