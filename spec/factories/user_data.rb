FactoryGirl.define do
  factory :user_data do
    sequence(:name) {|n| "name#{n}"}
    cpf { CPF.generate }
    gender { [:male, :female].sample }
    association :user, factory: :user
  end
end
