require 'factory_girl'

FactoryGirl.define do
  # sequence(:short_title) { |n| Forgery::LoremIpsum.words(6, random: true) }
  # sequence(:title) { |n| Forgery::LoremIpsum.words(10, random: true) }
  # sequence(:rating) { rand(100) }
  sequence(:day_off) do
    date_off = rand(30).to_s+'.'+rand(12).to_s+'.'+rand(14).to_s
    date_off.to_date
  end

  sequence(:deadline_date) do
    date_off.to_date + 10
  end


  factory :dateprice do
    day_of
    deadline_date
    price rand(100)
    factory :special_price do
      special true
    end
    factory :usual_price do
      special false
    end
  end
end
