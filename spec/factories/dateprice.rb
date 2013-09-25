FactoryGirl.define do
  sequence(:day_off) { (rand(30).to_s + '.' + rand(12).to_s + '.' + rand(14).to_s).to_date }
  sequence(:deadline_date) { date_off.to_date + 10 }

  factory :dateprice do
    day_of
    deadline_date
    price rand(100)
    factory :special_price do
      special true
    end
    factory :usual_price do
      special false
    end
  end
end
