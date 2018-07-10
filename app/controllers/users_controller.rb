# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[sign_in sign_up]
  before_action :find_user, only: %i[show edit update destroy deactivate reactivate]
  load_and_authorize_resource

  def index
    if current_user.admin?
      @users = User.with_deleted
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      UserMailer.with(user: @user).welcome_email.deliver_later
    end
  end

  def update
    # Remove the password key of the params hash if it's blank.
    # If not, Devise will fail to validate.
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

  def restore
	User.restore(params[:target])
	redirect_back(fallback_location: root_url)
  end

  def destroy
	@user.destroy
	redirect_back(fallback_location: root_url)
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
