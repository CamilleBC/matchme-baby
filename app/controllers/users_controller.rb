# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index sign_in sign_up]

  def new
    @user = User.new
  end

  def create
    if @user.save
      puts '********************************'
      puts 'Saved!'
      puts '********************************'
      # Tell the UserMailer to send a welcome email after save
      UserMailer.with(user: @user).welcome_email.deliver_later
    end
  end
end
