FactoryGirl.define do 
  factory :task do
    task_type { Faker::Lorem.word }
    priority { Faker::Number }
    duration_in_minutes { Faker::Number.digit }
  end
end