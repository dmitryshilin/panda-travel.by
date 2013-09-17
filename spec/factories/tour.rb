require 'factory_girl'

FactoryGirl.define do
  factory :tour, class: Tour do
    short_title 'Париж - Минск - Браслав'
    title 'Париж - Минск - БраславПариж - Минск - БраславПариж - Минск - Браслав'
    description 'Париж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - Браслав'
    rating 100
    published false
  end

  factory :empty_title_tour, class: Tour do
    short_title 'Париж - Минск - Браслав'
    title ''
    description 'Париж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - БраславПариж - Минск - Браслав'
    rating 100
    published false
  end
end