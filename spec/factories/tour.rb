require 'factory_girl'

FactoryGirl.define do
  sequence(:short_title) { |n| "Tour short title #{n}" }
  sequence(:title) { |n| "Tour very-very long title #{n}" }
  sequence(:rating) { rand(100) }

  factory :tour do
    short_title
    title
    description { Forgery::LoremIpsum.paragraphs(3) }
    rating
    factory :published_tour do
      published true
    end

    factory :unpublished_tour do
      published false
    end

    trait :with_dateprice do
      after :create do |tour|
        FactoryGirl.create_list :dateprice, 5, tour: tour
      end
    end
  end
end
