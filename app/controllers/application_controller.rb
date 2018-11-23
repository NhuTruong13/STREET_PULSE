class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :f_name, :l_name, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :f_name, :l_name, :photo])
  end



  def street_average
    counter = @reviews_in_radius.size
    total = 0.0
    @reviews_in_radius.each { |rating|
      total += rating[:street_review_average_rating]
    }
    if counter == 0
      return "N/A"
    else
      result = (total/counter).round(1)
      return "#{result}/5"
    end
  end

  def commune_average
    counter = @reviews_in_radius.size
    total = 0.0
    @reviews_in_radius.each { |rating|
      total += rating[:commune_review_average_rating]
    }
    if counter == 0
      return "N/A"
    else
      result = (total/counter).round(1)
      return "#{result}/5"
    end
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
    total = 0.0
    @answers_within_radius.each { |rating|
      if rating[q.to_sym] != [] && rating[q.to_sym] != nil
        total += rating[q.to_sym]
        counter += 1
      end
    }
    if counter > 0
      result = ((total/counter)*20).round
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
    query = Geocoder.search([search.latitude, search.longitude]).first
    # in case geocoder (maps api) fails --> assign zip_code = 9999
    if query.nil?
      zip_code = "9999"
    else
      zip_code = query.postal_code
    end
    return zip_code
  end

end
