# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index sign_in sign_up]

  def new
    @user = User.new
  end

  def create; end
end
