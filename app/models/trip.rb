class Trip < ActiveRecord::Base
  has_many :transactions, before_add: :build_transaction, dependent: :destroy
  has_many :users, through: :transactions

  validates_presence_of :description, :users

  monetize :value_cents

  def build_transaction(transaction)
    transaction.attributes= { description: self.description, type: :debit, compensated: true, value: self.value }
  end
end
