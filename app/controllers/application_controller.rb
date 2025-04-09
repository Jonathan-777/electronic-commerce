class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token unless Rails.env.production?
  #test
  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "You signed out, Bye!"
    root_path
  end
end
