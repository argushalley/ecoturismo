FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    sequence(:username) {|n| "username#{n}"}
    password 'password'
    role :default
    balance_cents 0
  end

  factory :admin, class: User do
    sequence(:email) {|n| "admin#{n}@example.com"}
    sequence(:username) {|n| "adminusername#{n}"}
    password 'password'
    role :admin
    balance_cents 0
  end
end
