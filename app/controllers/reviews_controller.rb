class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :vote]

  def index
    @reviews = Review.where("search_id = #{params[:search_id]}")
  end

  def show
  end

  def new
    @search = Search.find(params[:search_id])
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.commune = Commune.first
    @review.user = current_user
    @review.search = Search.find(params[:search_id])
    if @review.save!
      respond_to do |format|
        format.html { redirect_to new_search_review_answer_path(review_id: @review.id, search_id: @review.search_id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js
      end
    end
  end

  def vote
    @search = Search.find(params[:search_id])
    if current_user.voted_for?(@review)
      flash[:notice] = "You have cast your vote already."
    else
      @review.liked_by current_user
      # render partial: "reviews/vote", locals: { review: @review }
      respond_to do |format|
        format.html { redirect_to search_reviews_path(@search) }
        format.js
      end
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(
      :street_review_average_rating,
      :commune_review_average_rating,
      :street_review_title,
      :street_review_content,
      :commune_review_title,
      :commune_review_content)
  end
end
