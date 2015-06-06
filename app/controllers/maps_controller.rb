class MapsController < ApplicationController

  def index

    @query = Map
        .select("ROUND(lat::NUMERIC, 3) AS lat, ROUND(lon::NUMERIC, 3) AS lon, count(*) as weight")
        .where("lat IS NOT NULL")
        .group("ROUND(lat::NUMERIC, 3), ROUND(lon::NUMERIC, 3)")

    if params[:crime]
      @data = @query.where("crime ILIKE ?", '%' + params[:crime] + '%')
    else
      @data = @query
    end

    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render json: @data
      }
    end

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
