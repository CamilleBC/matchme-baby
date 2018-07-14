class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[sign_in sign_up]
  before_action :find_user, only: %i[show edit]
  before_action :find_target, only: %i[restore destroy]
  load_and_authorize_resource

  def index
    @users = if current_user.admin?
               User.with_deleted
             else
               User.all
             end
  end

  # def update
  #   # Remove the password key of the params hash if it's blank.
  #   # If not, Devise will fail to validate.
  #   if params[:user][:password].blank?
  #     params[:user].delete(:password)
  #     params[:user].delete(:password_confirmation)
  #   end
  # end

  def restore
    flash.notice = 'User successfully restored' if @target.restore
    redirect_back(fallback_location: root_url)
  end

  def destroy
    @target.destroy
    flash.notice = 'User successfully destroyed'
    redirect_back(fallback_location: root_url)
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end

  def find_target
    @target = User.with_deleted.friendly.find(params[:target_id])
  end
end
