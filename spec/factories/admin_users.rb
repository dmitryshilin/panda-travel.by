# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email 'admin@example.com'
    password 'password'
  end

  factory :bad_user, class: AdminUser do
    email 'badadmin@example.com'
    password 'badpassword'
  end

end
