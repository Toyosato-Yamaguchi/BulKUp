FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    gender                { 1 }
    body_weight           { 60 }
    body_height           { 170 }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2021-01-01') }
  end
end
