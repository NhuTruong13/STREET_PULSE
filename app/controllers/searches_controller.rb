class SearchesController < ApplicationController
  def index
  end

  def new
    @search = Search.new
  end

  def create
    # save to the DB only if user logged in
    if user_signed_in?
      @search = Search.new(reviews_params)
      @search.user = current_user
      # long & latit will be added by geocoder based on address while saving
      if @search.save
        # redirect to MAIN method
        # redirect_to ???_path(@review)
        main(@search)
      else
        render :new
      end
    else
      # do not save this search and redirect to MAIN method
    end
  end

  def main(search)
    @search = search
    # fetch reviews in given radius (using geocoder)
    # examples from LeWagon tutorial:
    # Flat.near('Tour Eiffel', 10)      # venues within 10 km of Tour Eiffel
    # Flat.near([40.71, 100.23], 20)    # venues within 20 km of a point

    # Review model - I think we should hook up geocoder here as well (same as search)
    # - that will make it easy to fetch reviews in radius (via "near" from geocoder)
    # Review model: I think the long/lati fields shall
    # be called latitude:float longitude:float (like geocoder demands)
    @reviews_in_radius = []
    # iterate thru all reviews, check if location in radius (via review.search)
    # Review.all do |r|
      # r.search.near(@search.address, @search.radius)
    # end

    # prepare markers to be displayed on the map (in a hash)


    # calculate necessary averages from the reviews

    # and render the view
  end

  private

  def reviews_params
    params.require(:review).permit(:address, :radius)
  end
end
