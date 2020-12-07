FactoryBot.define do
  factory :book do
    title      { 'マリアビートル' }
    author     { '伊坂幸太郎' }
    impression { '面白い' }
    association :user
  end
end
