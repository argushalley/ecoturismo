class UserData < ActiveRecord::Base
  before_validation :remove_cpf_formatting

  belongs_to :user, foreign_key: :user_id

  only_numbers_regexp = %r(\A\d+\z)

  validates :rg, allow_blank: true, uniqueness: true
  validates :cpf, presence: true,
                  uniqueness: true,
                  format: only_numbers_regexp
  validates :cpf, cpf: true

  enum gender: [:male, :female]

  def remove_cpf_formatting
    self.cpf.gsub!(/\D/, '') unless self.cpf.nil?
  end
end
