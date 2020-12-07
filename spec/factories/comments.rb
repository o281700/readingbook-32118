FactoryBot.define do
  factory :comment do
    text { '楽しい' }
    association :user
    association :book
  end
end
