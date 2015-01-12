require 'factory_girl'

FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    admin false
  end

  factory :category do
    sequence(:name) { |n| "miscellaneous #{n}" }
  end

  factory :vent do
    title "Insecurities"
    content "I may be a negative Nancy. But whenever
             you go out with your friends to clubs, or
             check out girls and tell me how hot they are…
             I get really insecure. Like, the lowest of
             lows of my insecurities. You may remind me
             constantly of how beautiful you think I am,
             but you prove to"

    category
  end

end
