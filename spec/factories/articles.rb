FactoryGirl.define do

  factory :article do
    short_title 'test_short_title'
    title 'test_title'
    content 'test_text'
    published true
    factory :pub_article do
      published true
    end
    factory :unpub_article do
      published false
    end
  end
end
