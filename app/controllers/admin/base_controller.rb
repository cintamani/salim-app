class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :require_admin

  private

  def require_admin
    unless admin_signed_in?
      redirect_to admin_login_path, alert: t("admin.sessions.login_required")
    end
  end
end
