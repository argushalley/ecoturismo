class UserDecorator < Draper::Decorator
  delegate_all
  delegate :name, :gender, :rg, :cpf, to: :data, prefix: true

  def gender
    h.t("activerecord.attributes.user_data.genders.#{data_gender}")
  end

  def admin_text
    h.content_tag :span,
      h.t("activerecord.attributes.user.admin_text.#{admin?}"),
      class: admin? ? 'label label-success' : 'label label-danger'
  end

  def formatted_cpf
    CPF.new(data_cpf).formatted
  end

  def humanized_balance
    h.content_tag :span,
      h.humanized_money_with_symbol(balance, no_cents_if_whole: false),
      class: balance >= 0 ? 'label label-success' : 'label label-danger'
  end
end
