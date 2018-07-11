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
        :nickname,
        :firstname,
        :surname,
        :avatar,
        :avatar_cache,
        { pictures: [] },
        :pictures_cache,
        :provider,
        :uid
      ]
    ).permit(
      :account_update, keys: [
        :nickname,
        :firstname,
        :surname,
        :avatar,
        :avatar_cache,
        { pictures: [] },
        :pictures_cache
      ]
    )
  end
end
