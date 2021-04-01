FactoryBot.define do
  factory :chart do
    chart_date    {Faker::Date.between(from: '2020-01-01', to: '2022-01-01')}
    weight        {Faker::Number.number(digits: 3)}
    calorie       {Faker::Number.between(from: 1, to: 4000)}
    protein       {Faker::Number.between(from: 1, to: 100)}
    lipid         {Faker::Number.between(from: 1, to: 100)}
    carbohydorate {Faker::Number.betwenn(from: 1, to: 100)}
    vitamin_B1    {Faker::Number.between(form: 0.0, to: 5.0)}
    vitamin_B2    {Faker::Number.between(form: 0.0, to: 5.0)}
    vitamin_B6    {Faker::Number.between(form: 0.0, to: 5.0)}
    vitamin_C     {Faker::Number.between(form: 0.0, to: 5.0)}
    vitamin_D     {Faker::Number.between(form: 0.0, to: 5.0)}

    association :user
  end
end
