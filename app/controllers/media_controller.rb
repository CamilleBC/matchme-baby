class MediaController < ApplicationController
  before_action :find_user

  def create
    @medium = Medium.new(media_params)
    flash.alert = 'Failed uploading medium' unless @medium.save
    if @user.avatar.blank? && @medium.type == 'image'
      @user.avatar = @medium.medium
    end
    redirect_back(fallback_location: root_url)
  end

  def destroy
    delete_image_at_index(params[:id].to_i)
    flash.alert = 'Failed deleting picture' unless @user.save
    redirect_back(fallback_location: root_url)
  end

  private

  def find_user
    @user = User.friendly.find(:user_id)
  end

  def media_params
    params.require(:medium).permit(:medium, :type, :user_id)
  end
end
