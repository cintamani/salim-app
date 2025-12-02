class Admin::SessionsController < ApplicationController
  layout "admin"

  def new
    redirect_to admin_dashboard_path if admin_signed_in?
  end

  def create
    admin = Admin.find_by(email: params[:email])

    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_dashboard_path, notice: t("admin.sessions.logged_in")
    else
      flash.now[:alert] = t("admin.sessions.invalid_credentials")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to admin_login_path, notice: t("admin.sessions.logged_out")
  end
end
