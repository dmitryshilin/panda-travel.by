require 'factory_girl'

FactoryGirl.define do

  factory :tour do
    short_title { Forgery::LoremIpsum.words(3) }
    title { Forgery::LoremIpsum.sentences(2) }
    description { Forgery::LoremIpsum.paragraphs(3) }
    rating 100
    factory :published_tour do
      published true
    end
    factory :unpublished_tour do
      published false
    end
  end

  factory :empty_title_tour, class: Tour do
    short_title { Forgery::LoremIpsum.words(3) }
    title
    description { Forgery::LoremIpsum.paragraphs(3) }
    rating 100
    published true
  end

  factory :accounts_manager, class: AdminUser do
    email '123@123.by'
    password '12345678'
  end
end
