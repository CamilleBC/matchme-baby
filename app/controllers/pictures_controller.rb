class PicturesController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_user
  # load_and_authorize_resource

  def create
    flash.alert = 'Failed uploading picture' unless @user.save
    redirect_back(fallback_location: root_url)
  end

  def destroy
    delete_image_at_index(params[:id].to_i)
    flash.alert = 'Failed deleting picture' unless @user.save
    redirect_back(fallback_location: root_url)
  end

  private

  def delete_image_at_index(index)
    remaining_pictures = @user.pictures
    deleted_picture = remaining_pictures.delete_at(index)
    @user.pictures = remaining_pictures
  end

  def find_user
    @user = User.friendly.find(params[:user_id])
  end

  def pictures_params
    params.require(:user).permit(pictures: [])
  end
end
