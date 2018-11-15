class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def new
    @search = Search.find(params[:search_id])
    @review = Review.find(params[:review_id])
    @answer = Answer.new
  end

  def create
    @search = Search.find(params[:search_id])
    @review = Review.find(params[:review_id])
    @answer = Answer.new(answer_params)
    @answer.review = @review
    if @answer.save!
      redirect_to searches_path
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:q1, :q2, :q3, :q4, :q5,
      :q6, :q7, :q8, :q9, :q10, :q11, :q12, :q13, :q14,
      :q15, :q16, :q17, :q18, :q19, :q20, :q21,
      :review_id, :search_id)
  end

end



# this is how to reject the empty strings we get from params
# params[:answer]["answer_text"].reject{|x| x.empty?}
