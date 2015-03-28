class TripDecorator < Draper::Decorator
  delegate_all
  decorates_association :users

  def humanized_value
    h.humanized_money_with_symbol(value, no_cents_if_whole: false)
  end

  def users_names
    users.map{|user_trip| user_trip.user_data_name}
  end

  def users_trip_balance
    users.each_with_object([]) do |user_trip, user_balance|
      user_balance << { name: user_trip.user_data_name, balance: balance_by_user(user_trip.user) }
    end
  end

  def balance_by_user(user)
    debit = user.transactions.debit.where(trip_id: object.id).map(&:value_cents).sum
    credit = user.transactions.credit.where(trip_id: object.id).map(&:value_cents).sum
    balance = credit >= debit ? 0 : -(debit - credit)
    h.humanized_money_with_symbol(Money.new(balance), no_cents_if_whole: false)
  end
end
