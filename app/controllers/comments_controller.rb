class CommentsController < ApplicationController
    before_action :authenticate_user!  
    before_action :set_listing, only: [:create, :destroy]
    
    def create
        # Comment attribute data in @listing created by set_listing method create and assigns to the @comment variable
        @comment = @listing.comments.create(comment_params)
        # Save the @comment data in the database
        if @comment.save
            # Redirect to listing show page through @listing data(id) with notice message
            redirect_to listing_path(@listing), notice: 'Comment succeeded!'
        else
            flash[:alert] = 'Comment failed.'
            # The data not saved and redirect to the page user was before
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        # Retrieve only one record with the :id received in params from Comment model and assign to @comment instance variable. 
        @comment = Comment.find(params[:id])
        # When destroy method called, it destroys the instance valiable(@comment)
        if @comment.destroy
          # Redirect to listing show page through @listing data(id) with notice message
          redirect_to listing_path(@listing), notice: 'Deleted the comment'
        else
          flash[:alert] = 'Failed to delete the comment'
          # Render to listing show page through @listing data(id)
          render listing_path(@listing)
        end
    end

    private
    def set_listing
      # Retrieve only one record with the :listing_id received in params from Listing model and assign to @listing instance variable. 
      @listing = Listing.find(params[:listing_id])
    end

    def comment_params
        params.require(:comment).permit(:comment).merge(user_id: current_user.id, listing_id: params[:listing_id])
    end
end
