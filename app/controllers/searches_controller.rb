class SearchesController < ApplicationController
  def index
  end

  def new
    @search = Search.new
  end

  def create
    if params[:q].present?
      raise
      @search = search.new(search_params)
      @search.address = params[:q]
      respond_to do |format|
        if @search.save
          format.html { redirect_to @search, notice: 'search was successfully created.' }
          format.json { render :show, status: :created, location: @search }
        else
          format.html { render :new }
          format.json { render json: @search.errors, status: :unprocessable_entity }
        end
      end
    else
      render :new
    end
  end

  def show
    @search = search.find(params[:id])
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
    params.require(:search).permit(:radius, :address, :latitude, :longitude, :user_id, :commmune_id)
  end
end
