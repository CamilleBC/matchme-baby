# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def marvin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success, kind: '42')
      end
    else
      session['devise.marvin_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
