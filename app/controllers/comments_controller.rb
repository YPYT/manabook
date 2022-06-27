class CommentsController < ApplicationController
    before_action :authenticate_user!  
    
    def create
        @listing = Listing.find(params[:listing_id])
        @comment = @listing.comments.create(comment_params)
        if @comment.save
            redirect_to listing_path(@listing), notice: 'Comment succeeded!'
        else
            flash[:alert] = 'Comment failed.'
            render listing_path(@listing)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
          redirect_to listing_path(@listing), notice: 'Deleted the comment'
        else
          flash[:alert] = 'Failed to delete comment.'
          render listing_path(@listing)
        end
    end

private
    def comment_params
        params.require(:comment).permit(:comment).merge(user_id: current_user.id, listing_id: params[:listing_id])
    end
end
