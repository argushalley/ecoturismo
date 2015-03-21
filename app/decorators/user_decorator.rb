class UserDecorator < Draper::Decorator
  delegate_all
  delegate :name, :gender, :rg, :cpf, to: :data, prefix: true

  def role
    h.content_tag :span,
      admin? ? 'Sim' : 'Não',
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
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
