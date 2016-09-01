class BikeRoutesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_its_not_admin?, only: [:edit, :destroy, :index_all_not_approved_bike_routes, :approve, :disapprove]
  before_action :find_bike_route, only: [:show, :edit, :update, :approve, :disapprove, :upvote, :downvote, :destroy]

  def index
    @bike_routes = BikeRoute.where(approved: true)
  end

  def index_all_not_approved
    @not_approved_bike_routes = BikeRoute.where(approved: false)
  end

  def show
    @random_bike_route = BikeRoute.where.not(id: @bike_route).order("RANDOM()").first
  end

  def new
    @bike_route = BikeRoute.new
  end

  def create
    @bike_route = current_user.bike_routes.new(permit_bike_route)

    if @bike_route.save
      flash[:notice] = "Дякуємо, ваш маршрут буде розглянуто модератором!"
      redirect_to bike_route_path(@bike_route)
    else
      flash[:alert] = @bike_route.errors.full_messages
      render new_bike_route_path
    end
  end

  def edit
  end

  def update
    if @bike_route.update(params[:bike_route].permit(:title, :description, :rating, :image, :map_url, :approved))
      redirect_to @bike_route
    else
      render 'edit'
    end
  end

  def approve
    @bike_route.approved = true
    if @bike_route.save
      redirect_to index_all_not_approved_bike_routes_path
    end
    end

  def disapprove
    @bike_route.approved = false
    if @bike_route.save
      redirect_to index_all_not_approved_bike_routes_path
    end
  end

  def upvote
    @bike_route.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @bike_route.downvote_by current_user
    redirect_to :back
  end

  def destroy
    @bike_route.destroy
    redirect_to bike_routes_path
  end

  private
    def permit_bike_route
      params.require(:bike_route).permit(:title, :description, :user_id, :rating, :image, :map_url, :approved)
    end

    def check_if_its_not_admin?
      if user_signed_in? && current_user.admin
        true
      else
        flash[:alert] = "Будь-ласка ввійдіть під своїм логіном"
        redirect_to bike_routes_path
      end
    end

    def find_bike_route
      @bike_route = BikeRoute.find(params[:id])
    end
end
