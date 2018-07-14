class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    # if resource.media.present?
    #   resource.media.each do |m|
    #     if resource.avatar.blank? && m.medium_type == 'image'
    #       resource.avatar = m.medium
    #       return
    #     end
    #   end
    # end
    # params[:user][:media_attributes].each do |_key, value|
    #   puts '****@*@***@*@*@**@*@*@**@*@*@*@ MEDIAAA'
    #   medium = Medium.new(medium: value[:medium],
    #                       medium_type: value[:type],
    #                       user_id: resource.id)
    #   medium.save!
    # end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [
  #                                       media_attributes: %i[
  #                                         medium
  #                                         medium_cache
  #                                         medium_type
  #                                       ]
  #                                     ])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [

  #                                       { medium: %i[
  #                                         medium
  #                                         medium_cache
  #                                         type
  #                                       ] }
  #                                     ])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
