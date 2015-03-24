require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:transactions) }
  it { is_expected.to have_one(:data).class_name('UserData').dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:data) }
  it { is_expected.to delegate(:name).to(:data).with_prefix }
  it { is_expected.to define_enum_for(:role).with([:default, :admin]) }
  it { is_expected.to monetize(:balance_cents) }

  describe "#update_balance!" do
    let!(:user) { create(:user) }
    let!(:credit_transaction_1) { create(:transaction, type: :credit, value: Money.new(100), compensated: true, compensated_at: 1.day.ago, user: user) }
    let!(:credit_transaction_2) { create(:transaction, type: :credit, value: Money.new(10),  compensated: false, compensated_at: nil, user: user) }
    let!(:debit_transaction_1) { create(:transaction, type: :debit, value: Money.new(50), compensated: true, compensated_at: 5.days.ago, user: user) }
    let!(:debit_transaction_2) { create(:transaction, type: :debit, value: Money.new(10), compensated: true, compensated_at: 6.days.ago, user: user) }

    before do
      user.update(balance: Money.new(0))
    end

    it "updates the user balance" do
      expected = Money.new(credit_transaction_1.value - (debit_transaction_1.value + debit_transaction_2.value))
      actual = user.balance
      expect { user.update_balance! }.to change { user.balance }.from(actual).to(expected)
    end
  end
end
