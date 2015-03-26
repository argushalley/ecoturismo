require 'rails_helper'

describe UserDecorator do
  let(:data) { build_stubbed(:user_data) }
  let(:user) { build_stubbed(:user, data: data) }

  subject(:decorator) { described_class.new(user) }

  describe '#gender' do
    it { expect(decorator.gender).to eq(h.t("activerecord.attributes.user_data.genders.#{data.gender}")) }
  end

  describe '#admin_text' do
    context 'when admin user' do
      before do
        user.role = :admin
      end

      it { expect(h.strip_tags(decorator.admin_text)).to eq('Sim') }
    end

    context 'when default user' do
      it { expect(h.strip_tags(decorator.admin_text)).to eq('Não') }
    end
  end

  describe '#formatted_cpf' do
    it 'returns the formatted cpf' do
      actual = decorator.formatted_cpf
      expected = CPF.new(data.cpf).formatted
      expect(actual).to eq(expected)
    end
  end

  describe '#humanized_balance' do
    before do
      user.balance_cents = 1073
    end

    it 'return the humanized balance' do
      actual = h.strip_tags(decorator.humanized_balance)
      expected = 'R$10,73'
      expect(actual).to eq(expected)
    end
  end
end
