class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  before_save :update_total_pay
  after_update :send_email, :send_chatwork

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

  def send_email
    @admin = User.find_by role: 0
    UserNotifier.send_admin_email(@admin,
      self.user).deliver_now if self.user.present?
  end

  def send_chatwork
    if self.user.present?
      ChatWork::Message.create(room_id: self.user.chatwork_id,
        body: "#{I18n.t("chatworks.you_requseted_order_in_app")}")
      ChatWork::Message.create(room_id: Settings.chatwork_room,
        body: " #{self.user.email}
        #{I18n.t("chatworks.you_requseted_order_in_app")}")
    end
  end
end
