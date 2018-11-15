class AnswersController < ApplicationController
  def new
    @search = Search.find(params[:search_id])
    @review = Review.find(params[:review_id])
    @answer = Answer.new
  end

  def create
    # @answer = Answer.new(answer_params)
    redirect_to searches_path
  end

  private
  # def answer_params
  #   params.require(:answer).permit(:, :ingredient_id).reject(&:empty?)
  # end
end




# params[:answer]["answer_text"].reject{|x| x.empty?}
