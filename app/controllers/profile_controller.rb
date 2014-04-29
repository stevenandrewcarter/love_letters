class ProfileController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def update
    user = User.find(params[:user_id])
    @profile = user.profile
    @profile.update_attributes(profile_params)
    if @profile.save
      redirect_to user_profile_path(user.id, @profile.id)
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :gender, :date_of_birth, :photo, :country_code, :state_code)
  end
end
