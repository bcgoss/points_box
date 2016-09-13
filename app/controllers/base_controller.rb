class BaseController < ApplicationController

  def require_login
    !!current_user
  end

  def require_admin
    current_user && current_user.admin?
  end
end
