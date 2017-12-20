FactoryBot.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "secure11"
    first_name "Bob"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email
    password "7774445"
    first_name "Clara"
    last_name "Lund"
    admin true
  end

end