class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  before_save :update_total_pay

  require "chatwork"

  enum status: [:progress, :completed]

  def total_pay
    line_items.collect {|li| li.valid? ? (li.quantity * li.unit_price) : 0}.sum
  end

  delegate :email, to: :user, allow_nil: true

  private
  def update_total_pay
    self[:total_pay] = total_pay
  end
end
