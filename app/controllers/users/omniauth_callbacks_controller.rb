# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def marvin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    puts '****************** USER *******************'
    ap @user
    puts '*******************************************'
    if @user.persisted?
      puts '*************** PERSISTED *****************'
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: '42') if is_navigational_format?
    else
      session['devise.marvin_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
