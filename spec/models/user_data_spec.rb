require 'rails_helper'

describe UserData, type: :model do
  it { is_expected.to belong_to(:user).with_foreign_key(:user_id) }
  it { is_expected.to define_enum_for(:gender).with([:male, :female]) }
  it { is_expected.to allow_value("", nil).for(:rg) }
  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to allow_value(CPF.generate).for(:cpf) }
  it { is_expected.not_to allow_value("86402a6085b").for(:cpf) }

  #it 'validates uniqueness of cpf' do
  #  create(:user_data)
  #  validate_uniqueness_of(:cpf)
  #end

  #context 'when rg is present' do
  #  it 'validates uniqueness of rg' do
  #    create(:user_data)
  #    validate_uniqueness_of(:rg)
  #  end
  #end
end
