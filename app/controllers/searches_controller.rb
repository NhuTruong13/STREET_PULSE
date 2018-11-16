class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @search = Search.new
  end

  def create
    @search = Search.new({ :address => params[:search], :radius => params[:radius] })
    # save to the DB only if user logged in
    if user_signed_in?
      @search.user = current_user
      # long & latit will be added by geocoder based on address while saving
      render :new unless @search.save
    end
    # call the method main (to prepare @reviews_in_radius and @markers)
    main
  end

  def main
    # here is the query from the user (address and radius)
    # @search = @search

    # reviews within radius of address
    @reviews_in_radius = Review.near(@search.address, @search.radius)

    # @statistics is a hash with necessary stats calculated
    @stats = stats(@reviews_in_radius)

    # prepare markers to be displayed on the map (in a hash)
    @markers = @reviews_in_radius.map do |r|
      {
        lat: r.latitude,
        lng: r.longitude
      }
    end
    # and render the view
    render :main
  end

  private

  def search_params
    # params.require(:search).permit(:address, :radius, :latitude, :longitude)
    params.permit!
  end

  def stats(reviews)
    # return a hash with necessary statistics calculated
    # s1 = "average xxxxx"
    # return {
    #   :avg_rating1 => s1
    # }
  end
end
