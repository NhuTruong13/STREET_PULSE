class AnswersController < ApplicationController
  def new
    @search = Search.find(params[:search_id])
    @review = Review.find(params[:review_id])
    @answer = Answer.new
  end

  def create
    redirect_to searches_path
  end

  private

end
