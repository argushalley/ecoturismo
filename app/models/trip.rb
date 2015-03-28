class Trip < ActiveRecord::Base
  has_many :transactions, dependent: :destroy
  has_many :users, class_name: UserTrip

  validates_presence_of :description, :users

  monetize :value_cents
end
