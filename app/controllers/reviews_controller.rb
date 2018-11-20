class ReviewsController < ApplicationController
  # before_action :set_search, only: [:new, :create]

  def show
    @review = Review.find(params[:id])
  end

  def new
    @search = Search.find(params[:search_id])
    @review = Review.new
    @staticmap = static_map_for(@search)
    @commune = get_commune(@search) # fetch communune based on user input address
  end

  def create
    @review = Review.new(reviews_params)
    @search = Search.find(params[:search_id])

    @commune = get_commune(@search)

    @review.commune = @commune

    @review.search = @search
    @review.address = @search.address
    @review.user = current_user

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
      :size => "600x370",
      :markers => [location.latitude, location.longitude].join(","),
      :key => ENV['GOOGLE_API_SERVER_KEY']
    }
    query_string = params.map { |k, v| "#{k}=#{v}" }.join("&")
    return "https://maps.googleapis.com/maps/api/staticmap?" + query_string
  end

  private

  def get_commune(search)
    zip_code = Geocoder.search([search.latitude, search.longitude]).first.postal_code
    # in case geocode (maps api) fails --> assign zip_code = 9999
    zip_code = "9999" if zip_code == [] || zip_code.nil?
    # if commune does not exist in our DB then assign commune = N/A (first in the DB)
    commune = Commune.where(zip_code: zip_code).first
    commune = Commune.first if @review.commune.nil?
    return commune
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



