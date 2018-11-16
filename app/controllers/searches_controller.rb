class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new
    @search.address = params[:search]
    @search.user = current_user
    if @search.save!
      redirect_to main_page_path(:search => params[:search])
    else
      render :new
    end
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
      params.require(:search).permit(:address, :latitude, :longitude)
    end
  end
