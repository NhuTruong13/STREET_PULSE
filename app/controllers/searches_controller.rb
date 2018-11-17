class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @search = Search.new
  end

  def create
    # if radius empty - set the radius to default = 1km for example
    params[:radius] = 1000 unless params[:radius]
    params[:search] = "Brussels, Belgium" if params[:search] == ""

    @search = Search.new({ :address => params[:search], :radius => params[:radius] })

    # save to the DB only if user logged in
    if user_signed_in?
      @search.user = current_user
      # long & latit will be added to @search by geocoder based on address while saving
      render :new unless @search.save
    end

    # call main method which will render the main page
    main
  end

  def main
    # @search has the input from the user (address and radius)

    # get the reviews within radius(meters) of address
    radius_km = @search.radius / 1000.0
    @reviews_in_radius = Review.near(@search.address, radius_km)

    # @statistics is a hash with necessary stats calculated
    @stats = stats(@reviews_in_radius)

    # prepare markers to be displayed on the map (in a hash)
    @markers = @reviews_in_radius.map do |r|
      {
        lat: r.latitude,
        lng: r.longitude,
        title: r.address+" ("+r.street_review_average_rating.to_s+"/10)"
      }
    end

    # manually add marker for user input address
    @markers.unshift({
        lat: @search.latitude,
        lng: @search.longitude,
        title: @search.address
    })

    # and render the view
    render :main_test
  end

  private

  def stats(reviews)
    # return a hash with necessary statistics calculated
    # st_avg = 0.0
    # reviews.each do |r|
    #   st_avg += r.street_review_average_rating
    # end
    # st_avg /= reviews.size
    # return {
    #   :st_avg => st_avg
    # }
  end

  def search_params
    params.require(:search).permit(:address, :latitude, :longitude)
  end
end
