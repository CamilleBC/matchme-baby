# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  rescue_from CanCan::AccessDenied do |exception|
    # format.html { redirect_to main_app.root_url, alert: exception.message }
    flash.alert = exception.message
    redirect_back(fallback_location: root_url)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[nickname firstname surname provider uid]
    )
  end
end
