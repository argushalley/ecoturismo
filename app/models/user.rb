class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :data, class_name: 'UserData', dependent: :destroy
  has_many :transactions

  delegate :name, to: :data, prefix: true

  accepts_nested_attributes_for :data

  enum role: [:default, :admin]

  monetize :balance_cents

  def update_balance!
    write_attribute(:balance_cents, transactions.compensated.to_a.sum(&:signed_value_cents))
    self.save(validate: false)
  end
end
