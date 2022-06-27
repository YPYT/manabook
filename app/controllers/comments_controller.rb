class CommentsController < ApplicationController
    before_action :authenticate_user!  
    before_action :set_listing
    
    def create
        @comment = @listing.comments.create(comment_params)
        if @comment.save
            redirect_to listing_path(@listing), notice: 'Comment succeeded!'
        else
            flash[:alert] = 'Comment failed.'
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
          redirect_to listing_path(@listing), notice: 'Deleted the comment'
        else
          flash[:alert] = 'Failed to delete the comment'
          render listing_path(@listing)
        #   redirect_back(fallback_location: root_path)
        end
    end

    private
    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    def comment_params
        params.require(:comment).permit(:comment).merge(user_id: current_user.id, listing_id: params[:listing_id])
    end
end
