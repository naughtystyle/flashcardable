FactoryBot.define do
  sequence :title do |n|
    "title #{n}"
  end

  factory :deck do
    title
  end
end
