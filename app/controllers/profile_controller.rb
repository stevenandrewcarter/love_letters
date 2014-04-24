class ProfileController < ApplicationController
  def show

  end

  def update
    user = User.find(params[:user_id])
    profile = user.profile
    profile.update_attributes(profile_params)
    profile.save!
    redirect_to user_profile_path(user.id, profile.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :gender, :date_of_birth, :photo)
  end
end
