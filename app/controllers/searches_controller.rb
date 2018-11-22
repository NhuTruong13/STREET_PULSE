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
    @search.user = current_user if user_signed_in?

    # dirty fix: we save each search, otherwise for non-logged users the app crashes (at main.html.erb)
    @search.save

    # call main method which will render the main page UNLESS it's a call from new review with the intention to update the address
    if params[:update_address] == "yes"
      redirect_to new_search_review_path(@search)
    else
      main
    end
  end

  def main
    # @search has the input from the user (address and radius)

    # get the reviews within radius(meters) of address
    radius_km = @search.radius / 1000.0
    @reviews_in_radius = Review.near(@search.address, radius_km)
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
    #############################################################
    #############################################################
    ################## creating @stats hash #####################

        # fetching the answers for a review
        @answers_within_radius =  []
        @reviews_in_radius.each do |rev|
          @answers_within_radius << rev.answers.first unless rev.answers.first == nil || rev.answers.first == []

        end

        # @statistics is a hash with necessary stats calculated
        @street_average = street_average
        @commune_average = commune_average
        @friendliness = average("q7")
        @events = average("q8")
        @stay = average("q9")
        @quiet = average("q10")
        @green = average("q11")
        @clean = average("q12")
        @parking = average("q13")
        @cars = average("q14")
        @bikes = average("q15")
        @transportation = average("q16")
        @bike_lanes = average("q17")
        @pavement = average("q18")
        @lightened = average("q19")
        @playgrounds = average("q20")
        @dog_friendly = average("q21")

        # Here is the stats Hash
        @stats = {
          street_average: @street_average,
          commune_average: @commune_average,
          friendliness: @friendliness,
          events: @events,
          stay: @stay,
          quiet: @quiet,
          green: @green,
          clean: @clean,
          parking: @parking,
          cars: @cars,
          bikes: @bikes,
          transportation: @transportation,
          bike_lanes: @bike_lanes,
          pavement: @pavement,
          lightened: @lightened,
          playgrounds: @playgrounds,
          dog_friendly: @dog_friendly
        }

        ################## end of @stats hash ############
        ##################################################

    # calculate zip_code (for the green marker) for use in main.html.erb
    @zip_code = get_zip_code(@search)

    # lookup the commune (for the green marker) for use in main.html.erb
    @commune = get_commune(@zip_code)

    # and render the view
    render :main
  end







  private

  ##################################################################
  ###################################################################
  ################# computation methods ##########################
  
  ######################### strong params #######################
  def search_params
    params.require(:search).permit(:address, :latitude, :longitude)
  end
end
