FactoryBot.define do
  factory :comment do
    text { 'Sample comment text.' }
    association :user
    association :post
  end
end
