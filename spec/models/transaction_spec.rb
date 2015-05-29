require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:user).with_foreign_key(:user_id) }
  it { is_expected.to belong_to(:trip).with_foreign_key(:trip_id) }
  it { is_expected.to define_enum_for(:type).with([:credit, :debit]) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to monetize(:value_cents) }

  describe '.compensated' do
    let!(:transaction1) { create(:transaction, compensated: true) }
    let!(:transaction2) { create(:transaction, type: :credit, compensated: false) }
    let!(:transaction3) { create(:transaction, compensated: true) }

    it 'returns only compensated transactions' do
      expect(Transaction.compensated).to include(transaction1, transaction3)
      expect(Transaction.compensated).to_not include(transaction2)
    end
  end
end
