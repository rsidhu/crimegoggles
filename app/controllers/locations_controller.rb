class LocationsController < ApplicationController
  def index
    @locations = Location.all
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @locations
        }
    end
  end

  def show
    respond_to do |format|
          format.html {
              render
          }
          format.json {
              render json: @location
          }
      end
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(map_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Your location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_map
      @location = Location.find(params[:id])
    end

    def map_params
      params.require(:location).permit(:name, :address)
    end

end
