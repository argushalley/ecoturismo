require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { is_expected.to have_many(:transactions).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:transactions) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:users) }
  it { is_expected.to monetize(:value_cents) }
end
