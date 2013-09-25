FactoryGirl.define do
  # sequence(:short_title) { |n| "Article short title #{n}" }
  # sequence(:title) { |n| "Article very-very long and absolutly full title #{n}" }

  factory :article do
    short_title
    title
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
