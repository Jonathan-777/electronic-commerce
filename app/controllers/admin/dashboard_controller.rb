class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]
  before_action :redirect_if_admin_exists, only: [:new, :create]
  before_action :set_user, only: [:edit, :update_user, :destroy]

  def index
    @admins = Admins.all
  end

  # Admin creation form (only shown if no admin exists)
  def new
    @admin = Admin.new
  end

  # Create admin (only if no admin exists)
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to new_admin_session_path, notice: "Admin account created. Please sign in."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Admin creates new user
  def new_user
    @user = User.new(guest: false)
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_dashboard_index_path, notice: "User created."
    else
      render :new_user, status: :unprocessable_entity
    end
  end

  def edit
    # @user is already set by before_action
  end

  def update_user
    if @user.update(user_params)
      redirect_to admin_dashboard_index_path, notice: "User updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_dashboard_index_path, status: :see_other, notice: "User deleted."
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :password, :guest, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def redirect_if_admin_exists
    if Admin.exists?
      redirect_to new_admin_session_path, alert: "Admin account already exists."
    end
  end
end
