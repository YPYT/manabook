class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show, :edit, :update]

  def show

  end

  def edit
    if @user != current_user
      redirect_to root_path, alert: 'You are not allowed to do this.'
    end
  end

  def update
    # The @user instance containing the user data retrieved by the set_user method is updated using the update method. It receives all the data for the attributes allowed by user_params and stores them in the database.
    if @user.update(user_params)
      # When the date update, the view redirect to user show page through @user
      redirect_to user_path(@user)
    else
      # render to edit page when user data isn't updated
      render :edit
    end
  end

  def destroy
    # Retrieve only one record with the :id received in params from Listing model and assign to @listing instance variable. 
    @listing = Listing.find(params[:id])
    # When destroy method called, it destroys the instance valiable(@listing)
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to user_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    # Retrieve only one record with the :id received in params from User model and assign to @user instance variable. 
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :profile_image, :email, :profile)
  end

end
