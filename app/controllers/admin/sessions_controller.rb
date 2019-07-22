# frozen_string_literal: true

class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_admin

  def new
    redirect_to admin_root_path if current_admin
  end

  def create
    if admin = Admin.find_by(name: params[:name]).try(:authenticate, params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_path, notice: 'Đăng nhập thành công!'
    else
      flash.now[:alert] = 'Đăng nhập thất bại!'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path, notice: 'Bạn đã thoát.'
  end
end
