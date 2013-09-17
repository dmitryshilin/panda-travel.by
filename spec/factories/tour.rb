require 'factory_girl'

FactoryGirl.define do
  factory :tour, class: Tour do
    short_title { Forgery::LoremIpsum.sentence }
    title { Forgery::LoremIpsum.sentence(3) }
    description { Forgery::LoremIpsum.sentence(10) }
    rating 100
    published false
  end

  factory :empty_title_tour, class: Tour do
    short_title { Forgery::LoremIpsum.sentence }
    title
    description { Forgery::LoremIpsum.sentence(10) }
    rating 100
    published true
  end
end