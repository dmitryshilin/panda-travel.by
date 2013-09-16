FactoryGirl.define do
  #sequence(:random_string) { |n| LoremIpsum.generate }

  factory :news do
    sequence(:short_title) {|n| "short_title-#{n}"}
    sequence(:title) {|n| "title-#{n}"}
    sequence(:content) {|n| "content-#{n}"}
    trait(:published) { published true }
    trait(:unpublished) { published false }

  end
end