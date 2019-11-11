FactoryGirl.define do
    factory :post do
      title    { Faker::Name.name }
      body { Faker::Lorem.sentence(word_count: 3) }
    end
  end