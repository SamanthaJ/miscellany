FactoryGirl.define do 
  factory :fact do 
    question { Faker::Lorem.sentence }
    answer { Faker::Lorem.paragraph(3) }
  end
end

