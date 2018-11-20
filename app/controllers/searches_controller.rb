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

    # dirty fix: we save each search, otherwise for non-logged users the app crashes (at main.html.erb)
    @search.save

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
        title: r.address+" ("+r.street_review_average_rating.to_s+"/10)",
        # stores the ID of this review instance in the marker so that
        # we can identify it back after the user clicks marker on the map
        review_id: r.id
      }
    end

    # add the green marker (the user input address)
    @markers.unshift({
      lat: @search.latitude,
      lng: @search.longitude,
      title: @search.address
    })

    # calculate zip_code (for the green marker) for use in main.html.erb
    @zip_code = get_zip_code(@search)

    # lookup the commune (for the green marker) for use in main.html.erb
    @commune = get_commune(@zip_code)

    # and render the view
    render :main
  end

  private

  def get_commune(zip_code)
    # if commune does not exist in our DB then assign commune = N/A (first in the DB)
    commune = Commune.where(zip_code: zip_code).first
    commune = Commune.first if commune.nil?
    return commune
  end

  def get_zip_code(search)
    zip_code = Geocoder.search([search.latitude, search.longitude]).first.postal_code
    # in case geocode (maps api) fails --> assign zip_code = 9999
    zip_code = "9999" if zip_code == [] || zip_code.nil?
    return zip_code
  end

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
