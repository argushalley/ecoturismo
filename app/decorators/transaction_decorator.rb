class TransactionDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def user_name
    user.data_name
  end

  def humanized_value
    h.content_tag :span,
      h.humanized_money_with_symbol(value, no_cents_if_whole: false),
      class: value >= 0 ? 'label label-success' : 'label label-danger'
  end
end
