class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :data, class_name: 'UserData', dependent: :destroy

  accepts_nested_attributes_for :data

  enum role: [:default, :admin]
end
