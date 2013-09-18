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

  factory :pub_news, class: News do
    short_title 'short_title1'
    title 'title'
    content 'content'
    published true
  end

  factory :unpub_news, class: News do
    short_title 'short_title2'
    title 'title2'
    content 'content2'
    published false
  end
end
