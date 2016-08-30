class BikeRoutesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_its_not_admin?, only: [:edit, :destroy]

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
    @bike_route = current_user.bike_routes.new(permit_bike_route)

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
    if @bike_route.update(params[:bike_route].permit(:title, :description, :rating, :image, :map_url))
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
    def permit_bike_route
      params.require(:bike_route).permit(:title, :description, :user_id, :rating, :image, :map_url)
    end

    def check_if_its_not_admin?
      if user_signed_in? && current_user.admin
        true
      else
        flash[:alert] = "Будь-ласка ввійдіть під своїм логіном"
        redirect_to bike_routes_path
      end
    end
end
