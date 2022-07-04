class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path, alert: 'You are not allowed to do this.'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to user_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :profile_image, :email, :profile)
  end

end
