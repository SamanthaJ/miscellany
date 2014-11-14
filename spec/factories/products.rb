FactoryGirl.define do 
  factory :product do 
    title { Faker::Lorem.word }
    price { Faker::Commerce.price }
    description { Faker::Lorem.sentence }
    stock { Faker::Number.number(3) }
  end
end