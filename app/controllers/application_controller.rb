class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  rescue_from CanCan::AccessDenied do |exception|
    flash.alert = exception.message
    redirect_back(fallback_location: root_url)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :id,
        :nickname,
        :firstname,
       :surname,
        :avatar,
        :avatar_cache,
        :provider,
        :uid,
        media_attributes: %i[
          medium
          medium_cache
          medium_type
        ]
      ]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[
        nickname
        firstname
        surname
        avatar
        avatar_cache
      ]
    )
  end
end
