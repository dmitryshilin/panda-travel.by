FactoryGirl.define do
  factory :visa do
    title { Forgery::LoremIpsum.words(1)  }
    description { Forgery::LoremIpsum.sentences(3) }
  end

  factory :bad_title_visa, class: Visa do
    title { Forgery::LoremIpsum.words(15)  }
    description { Forgery::LoremIpsum.sentences(3) }
  end
end