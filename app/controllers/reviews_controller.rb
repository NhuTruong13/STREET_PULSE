class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @search = Search.find(params[:search_id])
  end

  def create
    redirect_to new_search_review_answer_path
  end

  private

end
