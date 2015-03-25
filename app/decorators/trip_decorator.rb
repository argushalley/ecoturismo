class TripDecorator < Draper::Decorator
  delegate_all
  decorates_association :users

  def humanized_value
    h.content_tag :span,
      h.humanized_money_with_symbol(value, no_cents_if_whole: false)
  end
end
