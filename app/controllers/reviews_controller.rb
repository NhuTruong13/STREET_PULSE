class ReviewsController < ApplicationController
  before_action :set_search, only: [:index, :new, :create]

  # def index
  #   @reviews = Review.where(search_id: @search)
  # end

  def show # expanded modal to display a single review
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create

    if @review.save
      redirect_to search_reviews_path
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

  def set_search
    @search = Search.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
