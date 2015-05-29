require 'rails_helper'

describe TransactionDecorator do
  let(:data) { build_stubbed(:user_data) }
  let(:user) { build_stubbed(:user, data: data) }
    let(:transaction) { build_stubbed(:transaction, user: user, compensated_at: Time.current) }

  subject(:decorator) { described_class.new(transaction) }

  describe '#user_name' do
    it { expect(decorator.user_name).to eq(data.name) }
  end

  describe '#short_compensated_at' do
    it { expect(decorator.short_compensated_at).to eq(h.l(transaction.compensated_at, format: :short_date)) }
  end

  describe '#localized_type' do
    it { expect(decorator.localized_type).to eq(h.t("activerecord.attributes.transaction.types.#{transaction.type}")) }
  end

  describe '#compensated_text' do
    it 'returns the compensated_at text' do
      expect(h.strip_tags(decorator.compensated_text))
        .to eq(h.t("activerecord.attributes.transaction.compensated_text.#{transaction.compensated}"))
    end
  end

  describe '#humanized_value' do
    before do
      transaction.type = 'debit'
      transaction.value_cents = 999
    end

    it 'returns the humanized value' do
      actual = h.strip_tags(decorator.humanized_value)
      expected = 'R$-9,99'
      expect(actual).to eq(expected)
    end
  end
end
