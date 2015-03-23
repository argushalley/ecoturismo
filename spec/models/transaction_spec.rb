require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:user).with_foreign_key(:user_id) }
  it { is_expected.to define_enum_for(:type).with([:credit, :debit]) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:type) }
  #it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to monetize(:value_cents) }

  #describe ".compensated" do
  #  let!(:t1) { create(:transaction, compensated: true) }
  #  let!(:t2) { create(:transaction, :credit, compensated: false) }
  #  let!(:t3) { create(:transaction, compensated: true) }

  #  it "returns only compensated transactions" do
  #    expect(Transaction.compensated).to include(t1, t3)
  #    expect(Transaction.compensated).to_not include(t2)
  #  end
  #end
end
