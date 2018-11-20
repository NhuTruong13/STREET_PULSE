class ReviewsController < ApplicationController
  # before_action :set_search, only: [:new, :create]

  def show
    @review = Review.find(params[:id])
  end

  def new
    @search = Search.find(params[:search_id])
    @review = Review.new
    @staticmap = static_map_for(@search)
  end

  def create
    @review = Review.new(reviews_params)

    ############## Attention, commune has been sorta hardcoded #######
    # @review.commune = Commune.first

    # ------------------------------------------------
    # the right way to save the commune to the review:
    zip_code = Geocoder.search([@search.latitude, @search.longitude]).first.postal_code
    @review.commune = Commune.where(zip_code: zip_code).first
    # ------------------------------------------------

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

  def static_map_for(location)
    params = {
      :center => [location.latitude, location.longitude].join(","),
      :zoom => 16,
      :size => "350x450",
      :markers => [location.latitude, location.longitude].join(","),
      :key => ENV['GOOGLE_API_SERVER_KEY']
      }
    query_string = params.map { |k, v| "#{k}=#{v}" }.join("&")
    return "https://maps.googleapis.com/maps/api/staticmap?" + query_string
  end

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
