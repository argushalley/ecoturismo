class Trip < ActiveRecord::Base
  has_many :transactions, before_add: :build_transaction
  has_many :users, through: :transactions

  monetize :value_cents

  def build_transaction(transaction)
    transaction.attributes= { type: :debit, compensated: true, value: self.value }
  end
end
