FactoryBot.define do
  factory :post do
    association :author, factory: :user
    title { 'Sample Post Title' }
    text { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
