class UserTrip < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  delegate :data, to: :user, prefix: true
  delegate :name, to: :user_data, prefix: true
end
