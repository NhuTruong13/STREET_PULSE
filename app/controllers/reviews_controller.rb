class ReviewsController < ApplicationController
  # before_action :set_search, only: [:new, :create]

  def show # expanded modal to display a single review
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

  def static_map_for(location)
    params = {
      :center => [location.latitude, location.longitude].join(","),
      :zoom => 16,
      :size => "350x300",
      :markers => [location.latitude, location.longitude].join(","),
      :key => ENV['GOOGLE_API_SERVER_KEY']
      }
    query_string = params.map { |k, v| "#{k}=#{v}" }.join("&")
    "https://maps.googleapis.com/maps/api/staticmap?" + query_string

    # https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap
    # &markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318
    # &markers=color:red%7Clabel:C%7C40.718217,-73.998284
    # &key=YOUR_API_KEY
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
