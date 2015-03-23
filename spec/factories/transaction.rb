FactoryGirl.define do
  factory :transaction do
    sequence(:description) {|n| "description#{n}"}
    compensated false
    type { [:credit, :debit].sample }
    value_cents { rand(1..1029) }
    association :user, factory: :user
  end
end
