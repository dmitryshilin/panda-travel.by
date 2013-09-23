require 'factory_girl'

FactoryGirl.define do
  factory :tour, class: Tour do
    short_title { Forgery::LoremIpsum.words(5) }
    title { Forgery::LoremIpsum.words(10) }
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

  factory :accounts_manager, class: AdminUser do
    email '123@123.by'
    password '12345678'
  end
end
