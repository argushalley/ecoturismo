require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:transactions) }
  it { is_expected.to have_one(:data).class_name('UserData').dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:data) }
  #it { is_expected.to delegate(:name).to(:data).with_prefix }
  it { is_expected.to define_enum_for(:role).with([:default, :admin]) }
  it { is_expected.to monetize(:balance_cents) }
end
