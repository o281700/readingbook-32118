FactoryBot.define do
  factory :user do
    nickname              { 'test-user' }
    email                 { 'test@com' }
    password              { '1qaz2wsx' }
    password_confirmation { password }
  end
end
