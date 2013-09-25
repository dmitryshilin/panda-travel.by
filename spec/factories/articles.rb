FactoryGirl.define do
  factory :article do
    short_title
    title
    content 'test_text'
    factory :pub_article do
      published true
    end
    factory :unpub_article do
      published false
    end
  end
end
