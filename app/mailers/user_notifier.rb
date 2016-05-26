class UserNotifier < ApplicationMailer
  default form: I18n.t("mailer.eos")
  def send_admin_email admin, current_user
    @current_user = current_user
    @admin = admin
    mail from: ENV["ADMIN_EMAIL"], to: admin.email,
      subject: I18n.t("mailer.notifier")
  end
end
