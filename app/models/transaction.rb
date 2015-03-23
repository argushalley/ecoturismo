class Transaction < ActiveRecord::Base
  self.inheritance_column = :_type

  belongs_to :user, foreign_key: :user_id

  validates_presence_of :value, :user, :type
  validates_numericality_of :value, greater_than: 0

  before_save :set_compensated
  after_save :update_user_balance!
  after_destroy :update_user_balance!

  enum type: [:credit, :debit]

  monetize :value_cents

  scope :compensated, -> { where(compensated: true) }

  def positive_type?
    [:credit].include? type.to_sym
  end

  def negative_type?
    [:debit].include? type.to_sym
  end

  def signed_value_cents
    negative_type? ? -value_cents : value_cents
  end

  def signed_value
    negative_type? ? -value : value
  end

  private

  def update_user_balance!
    user.update_balance!
  end

  def set_compensated
    self.compensated_at = compensated? ? Time.current : nil if compensated_changed?
  end
end
