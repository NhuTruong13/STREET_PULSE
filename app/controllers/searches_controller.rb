class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new({ :address => params[:search], :radius => params[:radius] })
    # save to the DB only if user logged in
    if user_signed_in?
      @search.user = current_user
      # long & latit will be added by geocoder based on address while saving
      if @search.save
        # redirect to MAIN method
        # render :main
        # main(@search)
      else
        render :new
      end
    end
    # do not save this search and redirect to MAIN method
    # raise
    main
    render :main
  end

  def main
    # @search = search
    # @reviews_in_radius = []
    # venues within radius of address
    @reviews_in_radius = Review.near(@search.address, @search.radius)

    # prepare markers to be displayed on the map (in a hash)
    # raise
    @markers = @reviews_in_radius.map do |r|
      {
        lat: r.latitude,
        lng: r.longitude
      }
    end
    # calculate necessary averages from the reviews
    # and render the view
  end

  def show
    @search = Search.find(params[:id])
    # @mapelement = Array.new
    # build_mapelement(@search, @mapelement)
    @marker = [
      {
        lat: @search.latitude,
        lng: @search.longitude
      }]
  end

  private

  def search_params
    # params.require(:search).permit(:address, :radius, :latitude, :longitude)
    params.permit!
  end
end
