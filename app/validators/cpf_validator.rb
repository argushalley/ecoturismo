class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    unless CPF.valid?(value)
      record.errors.add(attribute, 'CPF inválido')
    end
  end
end
