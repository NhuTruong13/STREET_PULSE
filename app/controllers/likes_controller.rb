class LikesController < ApplicationController
  def index
    @likes = Like.where("review_id = #{params[:review_id]}")
  end

  def new
    @review = Review.find(params[:id])
    @like = Like.new
  end

  #create a route for this method
  def vote
    @review = Review.find(params[:id])
    if current_user.voted_for?(@review)
      flash[:notice] = "You have cast your vote already."
    else
      @review.liked_by current_user
    end
  end
end
