class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token unless Rails.env.production?
  #test
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      home_path
    end
    flash[:notice] = "You signed out, Bye!"
    home_path
  end

  helper_method :current_admin, :admin_signed_in?

  def current_admin
    warden.authenticate(scope: :admin)
  end

  def admin_signed_in?
    !!current_admin
  end

  # def authenticate_admin!
  #   unless admin_signed_in?
  #     flash[:alert] = "You must be an admin to access this section."
  #     redirect_to new_admin_session_path
  #   end
  # end
  
end
