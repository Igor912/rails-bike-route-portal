module BikeRoutesHelper
  def get_author_name_from_bike_route(bike_route)
    unless bike_route.user_id
      return ''
    end

    user = User.find(bike_route.user_id)
    user.email.split('@')[0]
  end
end
