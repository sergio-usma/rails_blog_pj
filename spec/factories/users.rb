FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'https://example.com/photo.jpg' }
    bio { 'User bio' }
    posts_counter { 0 }
  end
end
