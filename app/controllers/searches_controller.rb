class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @search = Search.new
  end

  def create
    # if radius empty - set the radius to default = 1 for example
    params[:radius] = 1 unless params[:radius]

    @search = Search.new({ :address => params[:search], :radius => params[:radius] })

    # save to the DB only if user logged in
    if user_signed_in?
      @search.user = current_user
      # long & latit will be added to @search by geocoder based on address while saving
      render :new unless @search.save
    end

    # check if params are empty?
    # if address field empty the re-render the page
    render :new unless params[:search]

    # call main method which will render the main page
    main
  end

  def main
    # @search has the input from the user (address and radius)
    # @search = @search

    # get the reviews within radius of address
    @reviews_in_radius = Review.near(@search.address, @search.radius)

    # prepare markers to be displayed on the map (in a hash)
    @markers = @reviews_in_radius.map do |r|
      {
        lat: r.latitude,
        lng: r.longitude
      }
    end

    # manually add marker for user input address
    @markers.unshift({
        lat: @search.latitude,
        lng: @search.longitude
    })

    # @statistics is a hash with necessary stats calculated
    @stats = stats(@reviews_in_radius)

    # and render the view
    # render :main
    # raise
    render :main_test
  end

  private

  def stats(reviews)
    # return a hash with necessary statistics calculated
    # s1 = "average xxxxx"
    # return {
    #   :avg_rating1 => s1
    # }
  end

  def search_params
    params.require(:search).permit(:address, :latitude, :longitude)
  end
end
