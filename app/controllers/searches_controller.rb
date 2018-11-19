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
        lng: r.longitude
      }
    end

    # manually add marker for user input address
    @markers.unshift({
        lat: @search.latitude,
        lng: @search.longitude
    })


    # fetching the answers for a review
    @review_indexes = []
    @reviews_in_radius.each { |rir|
      @review_indexes << rir[:id]
    }
    @answers = Answer

    # @statistics is a hash with necessary stats calculated
    @street_average = streetAverage
    @commune_average = communeAverage
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

    # and render the view
    render :main_test
  end

  private

  def street_average
    counter = @reviews_in_radius.size
    total = 0
    @reviews_in_radius.each { |rating|
      total += rating[:street_review_average_rating]
      }
    return total/counter.round
  end

  def commune_average
    counter = @reviews_in_radius.size
    total = 0
    @reviews_in_radius.each { |rating|
      total += rating[:commune_review_average_rating]
      }
    return total/counter.round
  end

  def friendliness
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q7]
      counter += 1
      end
      }
    return total/counter.round(2)
  end

  def events
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q8]
      counter += 1
      }
    end
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def stay
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q9]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def quiet
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q10]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def green
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q11]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
      end
  end

  def clean
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q12]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def parking
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q13]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def cars
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q14]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def bikes
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q15]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def transportation
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q16]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def bike_lanes
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q17]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def pavement
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q18]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def lightened
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q19]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def playgrounds
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q20]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def dog_friendly
    counter = 0
    total = 0
    @reviews_in_radius.each { |rating|
      if rating != nil
      total += rating[:q21]
      counter += 1
      end
      }
      if counter > 0
      return total/counter.round(2)
      else
      return "N/A"
    end
  end

  def search_params
    params.require(:search).permit(:address, :latitude, :longitude)
  end
end
