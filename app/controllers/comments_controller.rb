class CommentsController < ApplicationController

  def create
    @bike_route = BikeRoute.find(params[:bike_route_id])
    @comment = @bike_route.comments.create(params[:comment].permit(:name, :body))

    redirect_to bike_route_path(@bike_route)
  end

  def destroy
    @bike_route = BikeRoute.find(params[:bike_route_id])
    @comment = @bike_route.comments.find(params[:id])
    @comment.destroy

    redirect_to bike_route_path(@bike_route)
  end
end
