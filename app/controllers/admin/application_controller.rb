# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  before_action :require_admin

  private

  def current_admin
    @admin ||= Admin.find_by(id: session[:admin_id])
  end

  def require_admin
    redirect_to admin_login_path unless current_admin
  end
end
