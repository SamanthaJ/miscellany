FactoryGirl.define do   
  factory :post do 
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph(3) }
  end
end