FactoryGirl.define do

  factory :news do
    short_title { Forgery::LoremIpsum.sentence  }
    title { Forgery::LoremIpsum.sentences(3) }
    content { Forgery::LoremIpsum.paragraphs(10) }
    published true
    factory :published_news do
       published true
    end
    factory :unpublished_news do
       published false
    end
  end
end