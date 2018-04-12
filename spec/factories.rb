FactoryBot.define do
  sequence :title do |n|
    "title #{n}"
  end

  factory :deck do
    title
  end

  factory :card do
    title
    question "Q"
    answer "A"
    deck

    trait :invalid do
      question nil
      answer nil
    end
  end

  factory :attempt do
    card
    correct true
  end
end
