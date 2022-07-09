class ListingsController < ApplicationController
  before_action :set_listing, only: [ :show, :edit, :update, :destroy ]
  before_action :set_form_vars, only: [ :new, :edit, :create ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  # GET /listings or /listings.json
  def index
    #there is no column about listing image because active strage is used to store images to the Amazon S3. This query is to avoid N+1 queries.
    @listings = Listing.with_attached_list_images
  end

  # GET /listings/1 or /listings/1.json
  def show 
  end

  # GET /listings/new
  def new
    # Creates a temporary variable from Listing model with no values in it to help display the posting form
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    # If user_id value on the listing is not current user_id value, it redirects to listing index page with "Unauthorized access." as a message.
    if @listing.user != current_user
      redirect_to listings_path, alert: "Unauthorized access."
    # If the listing users want to edit is sold, redirect to listing index page with "Can't edit because it's sold" as a message.
    elsif @listing.sold
      redirect_to listings_path, alert: "Can't edit because it's sold"
    end
  end

  # POST /listings or /listings.json
  def create
    # Read the allowed parameters in listing_params from the form on the post page and create a new object.(not save yet)
    @listing = Listing.new(listing_params)
    # The data of user belonging to the listing is the currently logged in user. current_user is a helper method of devise.
    @listing.user = current_user

    respond_to do |format|
      # save the post page (the form user created)
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      # receive permitted params and update and save the listing information
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    # When destroy method called, it destroys the instance valiable(@listing) that is instance from Listing model with the same :id value from set_listing 
    @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
        format.json { head :no_content }
      end
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      # Retrieve only one record with the :id received in params from Listing model and assign to @listing instance variable.  
      @listing = Listing.find(params[:id])
    end

    def set_form_vars
      # Get all elements of the Category model as an array and assign to @categories instance variable. 
      @categories = Category.all
      # Retrieve information on only the key of the element "condition" of the model and assign to @conditions instance variable. (condition is hash, which is in the file of the listing model).
      @conditions = Listing.conditions.keys
    end

    def authorize_user
      if current_user.id != @listing.user.id
        flash[:alert] = "Not allowed to do that."
        redirect_to listings_path
      end
    end
    
# Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :price, :description, :condition, :sold, :user_id, :category_id)
    end
end
