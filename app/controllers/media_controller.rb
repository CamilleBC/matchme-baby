class MediaController < ApplicationController
  before_action :find_medium, only: %i[destroy avatar]
  before_action :find_user, only: %i[create avatar]

  def create
    puts '****@*@***@*@*@**@*@*@**@*@*@*@ CREATE'
    @medium = Medium.new(media_params)
    flash.alert = "Failed uploading #{@medium.type}" unless @medium.save
    if @user.avatar.blank? && @medium.type == 'image'
      @user.avatar = @medium.medium
    end
    redirect_back(fallback_location: root_url)
  end

  def destroy
    flash.alert = "Failed deleting #{@medium.type}" unless @medium.destroy
    redirect_back(fallback_location: root_url)
  end

  def avatar
    @user.avatar = @medium.medium
    if @user.save
      flash.notice = 'Avatar set'
    else
      flash.alert = 'Failed setting avatar'
    end
    redirect_back(fallback_location: root_url)
  end

  private

  def find_medium
    @user = Medium.find(params[:id])
  end

  def find_user
    @user = User.friendly.find(params[:user_id])
  end

  def media_params
    params.require(:medium).permit(:medium, :medium_type, :user_id)
  end
end
