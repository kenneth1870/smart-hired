class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy]

  def index

    @profiles = User.candidates
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile.skills.build
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile, notice: "Profile was successfully created."
    else
      render :new
    end
  end

  def update
    binding.pry
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: "Profile was successfully destroyed."
  end

  private

  def set_profile
    @profile =  Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name,
                                    :last_name,
                                    :resume,
                                    :portfolio,
                                    :grade_level,
                                    address_attributes:
                                    %i[id street street2 city state zip_code],
                                    skills_attributes:
                                    %i[id name rating profile_id _destroy])
  end
end
