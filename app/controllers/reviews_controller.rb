class ReviewsController < ApplicationController
  # before_action :set_search, only: [:new, :create]

  def show # expanded modal to display a single review
    @review = Review.find(params[:id])
  end

  def new
    @search = Search.find(params[:search_id])
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
############## Attention, commune has been sorta hardcoded #######
    @review.commune = Commune.first
##################################################################
    @review.user = current_user
    @review.search = Search.find(params[:search_id])
    if @review.save!
      redirect_to new_search_review_answer_path(review_id: @review.id, search_id: @review.search_id)
    else
      render :new
    end
  end

  # let's assume we don't mess with those for now
  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

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
