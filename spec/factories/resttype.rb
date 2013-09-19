FactoryGirl.define do

  factory :resttype, class:RestType do
    title { Forgery::LoremIpsum.words(3) }
  end
end
