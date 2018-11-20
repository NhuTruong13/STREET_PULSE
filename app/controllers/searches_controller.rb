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
    # prepare markers to be displayed on the map (in a hash)
    @markers = @reviews_in_radius.map do |r|
      {
        lat: r.latitude,
        lng: r.longitude,
        title: r.address+" ("+r.street_review_average_rating.to_s+"/10)",
        # is it possible to store here the ID of this review instance, so that
        # we can identify it back after the user clicks market on the map?
        review_id: r.id
      }
    end

    # at the beginning manually add the green marker (the user input address)
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
          @answers_within_radius << rev.answers
        end
        # @statistics is a hash with necessary stats calculated
        @street_average = street_average
        @commune_average = commune_average
        @friendliness = friendliness
        @events = events
        @stay = stay
        @quiet = quiet
        @green = green
        @clean = clean
        @parking = parking
        @cars = cars
        @bikes = bikes
        @transportation = transportation
        @bike_lanes = bike_lanes
        @pavement = pavement
        @lightened = lightened
        @playgrounds = playgrounds
        @dog_friendly = dog_friendly

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
    @zip_code = Geocoder.search([@markers[0][:lat], @markers[0][:lng]]).first.postal_code

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
    return "#{result} %"  end

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

  def friendliness
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q7]
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

  def events
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q8]
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

  def stay
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q9]
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

  def quiet
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q10]
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

  def green
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q11]
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

  def clean
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q12]
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

  def parking
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q13]
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

  def cars
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q14]
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

  def bikes
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q15]
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

  def transportation
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q16]
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

  def bike_lanes
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q17]
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

  def pavement
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q18]
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

  def lightened
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q19]
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

  def playgrounds
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q20]
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

  def dog_friendly
    counter = 0
    total = 0
    @answers_within_radius.each { |rating|
      if rating != nil
      total += rating.first[:q21]
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

  ######################### strong params #######################
  def search_params
    params.require(:search).permit(:address, :latitude, :longitude)
  end
end
