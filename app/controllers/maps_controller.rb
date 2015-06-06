class MapsController < ApplicationController

  def index

    if params[:crime]
      @data = Map.where("crime ILIKE ?", '%' + params[:crime] + '%').limit(20)
    else
      @data = Map.limit(20)
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
