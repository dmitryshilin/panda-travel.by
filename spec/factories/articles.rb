FactoryGirl.define do
  factory :article do
    short_title
    title
    content 'test_text'
    published true
    factory :published_article do
      published true
    end
    factory :unpublished_article do
      published false
    end
  end

  factory :pub_article, class: Article do
    short_title 'test_short_title'
    title 'test_title'
    content 'test_text'
    published true
  end

  factory :unpub_article, class: Article do
    short_title 'test_short_title2'
    title 'test_title2'
    content 'test_text2'
    published false
  end
end
