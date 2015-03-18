class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :data, class_name: 'UserData'

  accepts_nested_attributes_for :data

  enum role: [:default, :admin]
end
