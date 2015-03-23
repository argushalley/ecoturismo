class TransactionDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def user_name
    user.data_name
  end

  def short_compensated_at
    l compensated_at, format: :short_date
  end

  def localized_type
    h.t("activerecord.attributes.transaction.types.#{type}")
  end

  def compensated_text
    h.content_tag :span,
      h.t("activerecord.attributes.transaction.compensated_text.#{transaction.compensated}"),
      class: compensated? ? 'label label-success' : 'label label-danger'
  end

  def humanized_value
    h.content_tag :span,
      h.humanized_money_with_symbol(signed_value, no_cents_if_whole: false),
      class: signed_value >= 0 ? 'label label-success' : 'label label-danger'
  end
end
