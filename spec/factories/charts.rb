FactoryBot.define do
  factory :chart do
    chart_date    {Faker::Date.between(from: '2020-01-01', to: '2022-01-01')}
    weight        {Faker::Number.number(digits: 3)}
    calorie       {Faker::Number.between(from: 0.0, to: 4000.0)}
    protein       {Faker::Number.between(from: 0.0, to: 100.0)}
    lipid         {Faker::Number.between(from: 0.0, to: 100.0)}
    carbohydorate {Faker::Number.between(from: 0.0, to: 100.0)}
    vitamin_B1    {Faker::Number.between(from: 0.00, to: 5.00)}
    vitamin_B2    {Faker::Number.between(from: 0.00, to: 5.00)}
    vitamin_B6    {Faker::Number.between(from: 0.00, to: 5.00)}
    vitamin_C     {Faker::Number.between(from: 0.00, to: 5.00)}
    vitamin_D     {Faker::Number.between(from: 0.00, to: 5.00)}

    association :user
  end
end
