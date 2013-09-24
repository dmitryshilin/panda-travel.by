require 'factory_girl'

FactoryGirl.define do
# "title #{n}"
  sequence(:short_title) { |n| Forgery::LoremIpsum.words(6, random: true) }
  sequence(:title) { |n| Forgery::LoremIpsum.words(10, random: true) }
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
  end
end


# FactoryGirl.define do
#   factory :coupon do
#     sequence(:title)     { |n| Forgery::LoremIpsum.words(n, :random => true) }
#     sequence(:starts_at) { |n| n.days.ago }
#   end
# end