FactoryBot.define do
  factory :recipe do
    recipe_name     { Faker::Lorem.word }
    ingredients     { Faker::Food.ingredient }
    nutrition       { Faker::Lorem.sentence }
    cooking_method  { Faker::Lorem.sentence }
    cooking_time_id { Faker::Number.within(range: 2..5)}

    association :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_imgae.png')
    end
  end
end
