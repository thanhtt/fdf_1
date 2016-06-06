class UserNotificationService
  def initialize user
    @user = user
  end

  def notify
    @admin = User.find_by role: 0
    if @user.present?
      UserNotifier.send_admin_email(@admin, @user).deliver_now
      ChatWork::Message.create(room_id: @user.chatwork_id,
        body: "#{I18n.t("chatworks.you_requseted_order_in_app")}")
      ChatWork::Message.create(room_id: Settings.chatwork_room,
        body: " #{@user.email}
        #{I18n.t("chatworks.you_requseted_order_in_app")}")
    end
  end
end
