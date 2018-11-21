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
  def street_average
    counter = @reviews_in_radius.size
    total = 0
    @reviews_in_radius.each { |rating|
      total += rating[:street_review_average_rating]
      }
      result = ((total/counter).round)*20
    return "#{result} %"
  end

  def commune_average
    counter = @reviews_in_radius.size
    total = 0
    @reviews_in_radius.each { |rating|
      total += rating[:commune_review_average_rating]
      }
      result = ((total/counter).round)*20
    return "#{result} %"
  end

  def type_of_population
    populations = [" Students ", " Families ", " Retirees ", " Tourists ", " Offices "]
    s = 0
    f = 0
    r = 0
    t = 0
    b = 0
    @answers_within_radius.each { |population|
      if :q5 == "Students"
        s += 1
      end
      if :q5 == "Families"
        f += 1
      end
      if :q5 == "Retirees"
        r += 1
      end
      if :q5 == "Tourists"
        t += 1
      end
      if :q5 == "Offices"
        b += 1
      end
    }
    population = {}
    population.merge!(students: s)
    population.merge!(families: f)
    population.merge!(retirees: r)
    population.merge!(tourists: t)
    population.merge!(business: b)
    population.values.sort!.reverse
    return population.keys.first.to_s.capitalize
  end

  def income
    incomes = ["Super High Income","High Income", "Average Income", "Low Income"]
    s=0
    h=0
    a=0
    l=0

    @answers_within_radius.each { |income|
      case :q6
      when "Super High Income"
        s += 1
      when "High Income"
        h += 1
      when "Average Income"
        a += 1
      when "Low Income"
        l += 1
      end
    }
    income_types = {}
    income_types.merge!(s: s)
    income_types.merge!(h: h)
    income_types.merge!(a: a)
    income_types.merge!(l: l)
    income_types.values.sort!.reverse
    return income_types.keys.first.to_s.capitalize
  end

  def average(q)
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating[q.to_sym] != [] && rating[q.to_sym] != nil
      total += rating[q.to_sym]
      counter += 1
      end
      }
      if counter > 0
        result = ((total/counter).round)*20
        return "#{result} %"
      else
        return "N/A"
      end
    end

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


  ######################### strong params #######################
  def search_params
    params.require(:search).permit(:address, :latitude, :longitude)
  end
end
