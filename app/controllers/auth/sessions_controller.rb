# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]       #issues with guest?

  
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected
  
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :guest])
  end


  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :guest])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :guest])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def after_sign_out_path_for(resource_or_scope)
    home_path
  end
end
