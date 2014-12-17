FactoryGirl.define do 
  factory :fact do 
    question { Faker::Lorem.paragraph(2) }
    answer { Faker::Lorem.paragraph(3) }
  end
end

