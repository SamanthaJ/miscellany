FactoryGirl.define do 
  factory :comment do 
    user_name { Faker::Name.name }
    body { Faker::Lorem.paragraph(3) }
  end
end