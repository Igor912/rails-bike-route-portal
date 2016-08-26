class BikeRoutesController < ApplicationController
  def index
    @bike_routes = BikeRoute.all
  end

  def show
    @bike_route = BikeRoute.find(params[:id])
  end

  def new
    @bike_route = BikeRoute.new
  end

  def create
    @bike_route = BikeRoute.new(permit_comment)

    if @bike_route.save
      flash[:notice] = "Маршрут успішно додано!"
      redirect_to bike_route_path(@bike_route)
    else
      flash[:alert] = @bike_route.errors.full_messages
      render new_bike_route_path
    end
  end

  def edit
    @bike_route = BikeRoute.find(params[:id])
  end

  def update
    @bike_route = BikeRoute.find(params[:id])
    if @bike_route.update(params[:bike_route].permit(:title, :description, :user_name, :rating))
      redirect_to @bike_route
    else
      render 'edit'
    end
  end

  def destroy
    @bike_route = BikeRoute.find(params[:id])
    @bike_route.destroy
    redirect_to bike_routes_path
  end

  private
    def permit_comment
      params.require(:bike_route).permit(:title, :description, :user_name, :rating)
    end
end
