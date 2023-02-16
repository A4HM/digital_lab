class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    redirect_to root_path, alert: "Not found 404"
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
